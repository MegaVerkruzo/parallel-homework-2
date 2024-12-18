# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-src")
  file(MAKE_DIRECTORY "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-src")
endif()
file(MAKE_DIRECTORY
  "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-build"
  "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix"
  "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix/tmp"
  "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix/src/parlaylib-populate-stamp"
  "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix/src"
  "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix/src/parlaylib-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix/src/parlaylib-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/alexey/00university/07semester/03parallel/02homework/parallel-homework-2/build/_deps/parlaylib-subbuild/parlaylib-populate-prefix/src/parlaylib-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
