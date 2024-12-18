cmake_minimum_required(VERSION 3.5.0)
project(02bfs VERSION 0.1.0 LANGUAGES C CXX)

add_executable(02bfs main.cpp)


include(FetchContent)
FetchContent_Declare(parlaylib
        GIT_REPOSITORY  https://github.com/cmuparlay/parlaylib.git
        GIT_TAG         master
)
FetchContent_GetProperties(parlaylib)
if(NOT parlaylib_POPULATED)
    FetchContent_Populate(parlaylib)
    add_subdirectory(${parlaylib_SOURCE_DIR} EXCLUDE_FROM_ALL)
endif()


target_link_libraries(02bfs PUBLIC parlay)