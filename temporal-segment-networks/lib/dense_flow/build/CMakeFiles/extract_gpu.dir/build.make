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
CMAKE_SOURCE_DIR = /home/s03/swk/temporal-segment-networks/lib/dense_flow

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/s03/swk/temporal-segment-networks/lib/dense_flow/build

# Include any dependencies generated for this target.
include CMakeFiles/extract_gpu.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/extract_gpu.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/extract_gpu.dir/flags.make

CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o: CMakeFiles/extract_gpu.dir/flags.make
CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o: ../tools/extract_flow_gpu.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/s03/swk/temporal-segment-networks/lib/dense_flow/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o -c /home/s03/swk/temporal-segment-networks/lib/dense_flow/tools/extract_flow_gpu.cpp

CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/s03/swk/temporal-segment-networks/lib/dense_flow/tools/extract_flow_gpu.cpp > CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.i

CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/s03/swk/temporal-segment-networks/lib/dense_flow/tools/extract_flow_gpu.cpp -o CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.s

CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.requires:

.PHONY : CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.requires

CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.provides: CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.requires
	$(MAKE) -f CMakeFiles/extract_gpu.dir/build.make CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.provides.build
.PHONY : CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.provides

CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.provides.build: CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o


# Object files for target extract_gpu
extract_gpu_OBJECTS = \
"CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o"

# External object files for target extract_gpu
extract_gpu_EXTERNAL_OBJECTS =

extract_gpu: CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o
extract_gpu: CMakeFiles/extract_gpu.dir/build.make
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_ts.a
extract_gpu: /usr/lib/x86_64-linux-gnu/libzip.so
extract_gpu: libdenseflow.a
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_videostab.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_ts.a
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_superres.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_stitching.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_contrib.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_nonfree.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_ocl.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_gpu.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_photo.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_objdetect.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_legacy.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_video.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_ml.so.2.4.13
extract_gpu: /usr/lib/x86_64-linux-gnu/libcufft.so
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_calib3d.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_features2d.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_highgui.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_imgproc.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_flann.so.2.4.13
extract_gpu: /home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib/libopencv_core.so.2.4.13
extract_gpu: /usr/lib/x86_64-linux-gnu/libcudart.so
extract_gpu: /usr/lib/x86_64-linux-gnu/libnppc.so
extract_gpu: /usr/lib/x86_64-linux-gnu/libnppi.so
extract_gpu: /usr/lib/x86_64-linux-gnu/libnpps.so
extract_gpu: /usr/lib/x86_64-linux-gnu/libzip.so
extract_gpu: CMakeFiles/extract_gpu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/s03/swk/temporal-segment-networks/lib/dense_flow/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable extract_gpu"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/extract_gpu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/extract_gpu.dir/build: extract_gpu

.PHONY : CMakeFiles/extract_gpu.dir/build

CMakeFiles/extract_gpu.dir/requires: CMakeFiles/extract_gpu.dir/tools/extract_flow_gpu.cpp.o.requires

.PHONY : CMakeFiles/extract_gpu.dir/requires

CMakeFiles/extract_gpu.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/extract_gpu.dir/cmake_clean.cmake
.PHONY : CMakeFiles/extract_gpu.dir/clean

CMakeFiles/extract_gpu.dir/depend:
	cd /home/s03/swk/temporal-segment-networks/lib/dense_flow/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/s03/swk/temporal-segment-networks/lib/dense_flow /home/s03/swk/temporal-segment-networks/lib/dense_flow /home/s03/swk/temporal-segment-networks/lib/dense_flow/build /home/s03/swk/temporal-segment-networks/lib/dense_flow/build /home/s03/swk/temporal-segment-networks/lib/dense_flow/build/CMakeFiles/extract_gpu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/extract_gpu.dir/depend

