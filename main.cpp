#include <iostream>
#include <vector>
#include <atomic>

#include <parlay/internal/get_time.h>
#include "parlay/primitives.h"

using namespace std;

inline bool is_correct_cell(int n, int z, int y, int x) {
    return z >= 0 && y >= 0 && x >= 0 && z < n && y < n && x < n;
}

inline int get_num_cell(int n, int z, int y, int x) {
    return n * n * z + n * y + x;
}

inline vector<vector<int>> build_square_graph(const int n) {
    vector<vector<int>> gr(n * n * n, vector<int>(0));
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            for (int k = 0; k < n; k++) {
                int cur_num = get_num_cell(n, i, j, k);
                int up_z_cur_num = get_num_cell(n, i + 1, j, k);
                int up_y_cur_num = get_num_cell(n, i, j + 1, k);
                int up_x_cur_num = get_num_cell(n, i, j, k + 1);

                if (is_correct_cell(n, i, j, k + 1)) {
                    gr[cur_num].push_back(up_x_cur_num);
                    gr[up_x_cur_num].push_back(cur_num);
                }
                if (is_correct_cell(n, i, j + 1, k)) {
                    gr[cur_num].push_back(up_y_cur_num);
                    gr[up_y_cur_num].push_back(cur_num);
                }
                if (is_correct_cell(n, i + 1, j, k)) {
                    gr[cur_num].push_back(up_z_cur_num);
                    gr[up_z_cur_num].push_back(cur_num);
                }
            }
        }
    }
    return gr;
}

vector<vector<int>> seq(const vector<vector<int>>& gr, int n, int z, int y, int x) {
    int start_num = get_num_cell(n, z, y, x);
    vector<vector<int>> result(1, vector<int>(1, start_num));
    vector<int> visited(n * n * n, 0);
    visited[start_num] = 1;
    while (result.back().size() > 0) {
        const auto& cur = result.back(); 
        vector<int> next;
    
        for (int a : cur) {
            for (int b : gr[a]) {
                if (visited[b] == 0) {
                    next.push_back(b);
                    visited[b] = 1;
                }
            }
        }

        // cout << "layers amount: " << result.size() << '\n';
        // cout << "sumoffsets: " << next.size() << " ----";
        // for (int i = 0; i < next.size(); i++) {
        //     cout << next[i] << ' ';
        // }
        // cout << '\n';

        result.push_back(next);
    }
    cout << "layers amount: " << result.size() << '\n';

    return result;
}

vector<vector<int>> parallel(const vector<vector<int>>& gr, int n, int z, int y, int x) {
    vector<std::atomic_bool> visited(gr.size());

    int start_num = get_num_cell(n, z, y, x);
    visited[start_num] = true;

    vector<vector<int>> result(1, vector<int>(1, start_num));

    while (!result.back().empty()) { 
        const auto& cur = result.back(); 
        vector<size_t> offsets = parlay::map(cur, [&gr](size_t i) { return gr[i].size(); }).to_vector();

        // cout << "offsets\n";
        // for (int i = 0; i < offsets.size(); i++) {
        //     cout << offsets[i] << ' ';
        // }
        // cout << '\n';
        size_t sum_offsets = parlay::scan_inplace(offsets);
        // cout << "offsets\n";
        // for (int i = 0; i < offsets.size(); i++) {
        //     cout << offsets[i] << ' ';
        // }
        // cout << '\n';

        vector<int> all_neighbours(sum_offsets);

        parlay::parallel_for(0, cur.size(), [& gr, & offsets, & all_neighbours, & cur] (size_t i) {
            size_t all_i = offsets[i];
            parlay::parallel_for(0, gr[cur[i]].size(), [ & gr, & all_i, & all_neighbours, & i, &cur] (size_t j) {
                all_neighbours[all_i + j] = gr[cur[i]][j];
            });
        });


        // cout << "layers amount: " << result.size() << '\n';
        // cout << "sumoffsets: " << sum_offsets << " ----";
        // for (int i = 0; i < sum_offsets; i++) {
        //     cout << all_neighbours[i] << ' ';
        // }
        // cout << '\n';

        result.push_back( 
            parlay::filter(all_neighbours, [&visited](size_t i) { 
                bool val = false; 
                // cout << "i=" << i << ", visited[i]=" << visited[i];
                bool result = !visited[i] && visited[i].compare_exchange_strong(val, true);
                // cout << ", result=" << result << '\n';
                return result; 
            }).to_vector()
        ); 

        // cout << "visited\n";
        // for (int i = 0; i < visited.size(); i++) {
        //     cout << visited[i] << ' ';
        // }
        // cout << '\n';
    } 
    // cout << "\n";

    cout << "layers amount: " << result.size() << '\n';
    return result;
}

inline double make_test_sort(
    const std::function<vector<vector<int>>(const std::vector<vector<int>> &, int, int, int, int)> &bfs, const std::vector<vector<int>> &gr, const std::string &print, 
    int n, int z, int y, int x
) {
    parlay::internal::timer t("Made");
    t.start();
    bfs(gr, n, z, y, x);
    double time_executed = t.next_time();
    cout << time_executed << '\n';
    return time_executed;
}

inline void launch(
    const std::function<vector<vector<int>>(const std::vector<vector<int>> &, int, int, int, int)> &bfs, const std::vector<vector<int>> &gr, const std::string &print, int k, 
    int n, int z, int y, int x
) {
    double mean = 0;
    for (int i = 0; i < k; i++) {
        mean += make_test_sort(bfs, gr, print, n, z, y, x);
    }
    std::cout << "mean time: " << mean / k << '\n';
}


int main(int, char *argv[]){
    auto usage = "Usage: 02bfs <n> <k>";

    int n;
    try { n = std::stol(argv[1]); }
    catch(...) {
        std::cout << usage << '\n';
        return 1;
    }

    int k;
    try { k = std::stol(argv[2]); }
    catch(...) {
        std::cout << usage << '\n';
        return 1;
    }

    cout << "Started to check n = " << n << ", with num_workers=" << parlay::num_workers() << "\n";
    cout << fixed;
    cout.precision(10);


    parlay::internal::timer t("Made");
    t.start();
    vector<vector<int>> gr = build_square_graph(n);
    double create_time = t.next_time();
    cout << "Create square time: " << create_time << "\n";

    launch(seq, gr, "sequence algorithm", k, n, 0, 0, 0);
    cout << "---------------------------------------------------------------------";
    launch(parallel, gr, "parallel algorithm", k, n, 0, 0, 0);
}
