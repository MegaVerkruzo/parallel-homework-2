# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/cmake/1433/bin/cmake

# The command to remove a file.
RM = /snap/cmake/1433/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build

# Include any dependencies generated for this target.
include CMakeFiles/02bfs.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/02bfs.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/02bfs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/02bfs.dir/flags.make

CMakeFiles/02bfs.dir/codegen:
.PHONY : CMakeFiles/02bfs.dir/codegen

CMakeFiles/02bfs.dir/main.cpp.o: CMakeFiles/02bfs.dir/flags.make
CMakeFiles/02bfs.dir/main.cpp.o: /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/main.cpp
CMakeFiles/02bfs.dir/main.cpp.o: CMakeFiles/02bfs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/02bfs.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/02bfs.dir/main.cpp.o -MF CMakeFiles/02bfs.dir/main.cpp.o.d -o CMakeFiles/02bfs.dir/main.cpp.o -c /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/main.cpp

CMakeFiles/02bfs.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/02bfs.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/main.cpp > CMakeFiles/02bfs.dir/main.cpp.i

CMakeFiles/02bfs.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/02bfs.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/main.cpp -o CMakeFiles/02bfs.dir/main.cpp.s

# Object files for target 02bfs
02bfs_OBJECTS = \
"CMakeFiles/02bfs.dir/main.cpp.o"

# External object files for target 02bfs
02bfs_EXTERNAL_OBJECTS =

02bfs: CMakeFiles/02bfs.dir/main.cpp.o
02bfs: CMakeFiles/02bfs.dir/build.make
02bfs: CMakeFiles/02bfs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable 02bfs"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/02bfs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/02bfs.dir/build: 02bfs
.PHONY : CMakeFiles/02bfs.dir/build

CMakeFiles/02bfs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/02bfs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/02bfs.dir/clean

CMakeFiles/02bfs.dir/depend:
	cd /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2 /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2 /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build /home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/CMakeFiles/02bfs.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/02bfs.dir/depend
