# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/s03/swk/temporal-segment-networks/lib/caffe-action

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/s03/swk/temporal-segment-networks/lib/caffe-action/build

# Include any dependencies generated for this target.
include python/CMakeFiles/pycaffe.dir/depend.make

# Include the progress variables for this target.
include python/CMakeFiles/pycaffe.dir/progress.make

# Include the compile flags for this target's objects.
include python/CMakeFiles/pycaffe.dir/flags.make

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o: python/CMakeFiles/pycaffe.dir/flags.make
python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o: ../python/caffe/_caffe.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o"
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o -c /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/_caffe.cpp

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.i"
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/_caffe.cpp > CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.i

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.s"
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/_caffe.cpp -o CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.s

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires:

.PHONY : python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires
	$(MAKE) -f python/CMakeFiles/pycaffe.dir/build.make python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides.build
.PHONY : python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides

python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.provides.build: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o


# Object files for target pycaffe
pycaffe_OBJECTS = \
"CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o"

# External object files for target pycaffe
pycaffe_EXTERNAL_OBJECTS =

lib/_caffe.so: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o
lib/_caffe.so: python/CMakeFiles/pycaffe.dir/build.make
lib/_caffe.so: lib/libcaffe.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
lib/_caffe.so: /usr/local/lib/libboost_python.so
lib/_caffe.so: lib/libproto.a
lib/_caffe.so: /usr/local/lib/libboost_system.so
lib/_caffe.so: /usr/local/lib/libboost_thread.so
lib/_caffe.so: /usr/local/lib/libboost_chrono.so
lib/_caffe.so: /usr/local/lib/libboost_date_time.so
lib/_caffe.so: /usr/local/lib/libboost_atomic.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libpthread.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libglog.so
lib/_caffe.so: /usr/local/lib/libgflags.a
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/hdf5/serial/lib/libhdf5_hl.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/hdf5/serial/lib/libhdf5.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libsz.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libz.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libm.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libpthread.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libglog.so
lib/_caffe.so: /usr/local/lib/libgflags.a
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/hdf5/serial/lib/libhdf5_hl.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/hdf5/serial/lib/libhdf5.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libsz.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libz.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libdl.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libm.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/liblmdb.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libleveldb.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libsnappy.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libcudart.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libcurand.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libcublas.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libcudnn.so
lib/_caffe.so: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_highgui.so.2.4.13
lib/_caffe.so: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_imgproc.so.2.4.13
lib/_caffe.so: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_core.so.2.4.13
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libcudart.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libnppc.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libnppi.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libnpps.so
lib/_caffe.so: /usr/lib/liblapack_atlas.so
lib/_caffe.so: /usr/lib/libcblas.so
lib/_caffe.so: /usr/lib/libatlas.so
lib/_caffe.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
lib/_caffe.so: /usr/local/lib/libboost_python.so
lib/_caffe.so: python/CMakeFiles/pycaffe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../lib/_caffe.so"
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pycaffe.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating symlink /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/_caffe.so -> /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/lib/_caffe.so"
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && ln -sf /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/lib/_caffe.so /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/_caffe.so
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && /usr/bin/cmake -E make_directory /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/proto
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && touch /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/proto/__init__.py
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && cp /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/include/caffe/proto/*.py /home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/proto/

# Rule to build all files generated by this target.
python/CMakeFiles/pycaffe.dir/build: lib/_caffe.so

.PHONY : python/CMakeFiles/pycaffe.dir/build

python/CMakeFiles/pycaffe.dir/requires: python/CMakeFiles/pycaffe.dir/caffe/_caffe.cpp.o.requires

.PHONY : python/CMakeFiles/pycaffe.dir/requires

python/CMakeFiles/pycaffe.dir/clean:
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python && $(CMAKE_COMMAND) -P CMakeFiles/pycaffe.dir/cmake_clean.cmake
.PHONY : python/CMakeFiles/pycaffe.dir/clean

python/CMakeFiles/pycaffe.dir/depend:
	cd /home/s03/swk/temporal-segment-networks/lib/caffe-action/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s03/swk/temporal-segment-networks/lib/caffe-action /home/s03/swk/temporal-segment-networks/lib/caffe-action/python /home/s03/swk/temporal-segment-networks/lib/caffe-action/build /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python /home/s03/swk/temporal-segment-networks/lib/caffe-action/build/python/CMakeFiles/pycaffe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : python/CMakeFiles/pycaffe.dir/depend

