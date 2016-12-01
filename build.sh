#!/bin/bash
roots_path=`pwd`

src_path=$roots_path/src
tests_path=$roots_path/tests
build_path=$roots_path/build

# make build directory
mkdir $build_path
mkdir $build_path/src
mkdir $build_path/tests

src_source_list=`find $src_path | egrep '\.cpp$'`
tests_source_list=`find $tests_path | egrep '\.cpp$'`

# c++ flags
CXXFLAGS="$CXXFLAGS -fprofile-arcs -ftest-coverage"
CXXFLAGS="$CXXFLAGS -std=c++11"

# library
LIB="$LIB"

# src build
cd $build_path/src
for filename in $src_source_list; do
  g++ $CXXFLAGS -I$src_path/include -g -c $filename $LIB
done

# tests build
cd $build_path/tests
for filename in $tests_source_list; do
  base_filename=$(basename $filename)
  # compile
  g++ $CXXFLAGS -I$src_path/include -g -c $filename $LIB
  # linking
  build_src_object_list=`find $build_path/src | egrep '\.o$'`
  g++ $CXXFLAGS -o ${base_filename%.*} ${base_filename%.*}.o $build_src_object_list $LIB
  # execute
  ./${base_filename%.*}
done

# gcov
build_src_object_list=`find $build_path/src | egrep '\.o$'`
build_tests_object_list=`find $build_path/tests | egrep '\.o$'`

cd $build_path/src
for filename in $build_src_object_list; do
  gcov $filename
done

cd $build_path/tests
for filename in $build_tests_object_list; do
  gcov $filename
done

