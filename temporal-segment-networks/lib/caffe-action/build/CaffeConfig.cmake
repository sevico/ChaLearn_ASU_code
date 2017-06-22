# Config file for the Caffe package.
#
# Note:
#   Caffe and this config file depends on opencv,
#   so put `find_package(OpenCV)` before searching Caffe
#   via `find_package(Caffe)`. All other lib/includes
#   dependencies are hard coded in the file
#
# After successful configuration the following variables
# will be defined:
#
#   Caffe_INCLUDE_DIRS - Caffe include directories
#   Caffe_LIBRARIES    - libraries to link against
#   Caffe_DEFINITIONS  - a list of definitions to pass to compiler
#
#   Caffe_HAVE_CUDA    - signals about CUDA support
#   Caffe_HAVE_CUDNN   - signals about cuDNN support


# OpenCV dependency

if(NOT OpenCV_FOUND)
  set(Caffe_OpenCV_CONFIG_PATH "/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build")
  if(Caffe_OpenCV_CONFIG_PATH)
    get_filename_component(Caffe_OpenCV_CONFIG_PATH ${Caffe_OpenCV_CONFIG_PATH} ABSOLUTE)

    if(EXISTS ${Caffe_OpenCV_CONFIG_PATH} AND NOT TARGET opencv_core)
      message(STATUS "Caffe: using OpenCV config from ${Caffe_OpenCV_CONFIG_PATH}")
      include(${Caffe_OpenCV_CONFIG_PATH}/OpenCVModules.cmake)
    endif()

  else()
    find_package(OpenCV REQUIRED)
  endif()
  unset(Caffe_OpenCV_CONFIG_PATH)
endif()

# Compute paths
get_filename_component(Caffe_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(Caffe_INCLUDE_DIRS "/home/s03/swk/temporal-segment-networks/lib/caffe-action/src;/usr/local/include;/usr/include;/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/include;/usr/include/hdf5/serial;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/include/opencv;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/core/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/flann/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/imgproc/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/highgui/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/features2d/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/calib3d/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/ml/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/video/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/legacy/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/objdetect/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/photo/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/gpu/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/ocl/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/nonfree/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/contrib/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/stitching/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/superres/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/ts/include;/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/modules/videostab/include;/usr/include/atlas;/home/s03/swk/temporal-segment-networks/lib/caffe-action/include")



# Our library dependencies
if(NOT TARGET caffe AND NOT caffe_BINARY_DIR)
  include("${Caffe_CMAKE_DIR}/CaffeTargets.cmake")
endif()

# List of IMPORTED libs created by CaffeTargets.cmake
set(Caffe_LIBRARIES caffe)

# Definitions
set(Caffe_DEFINITIONS "")

# Cuda support variables
set(Caffe_CPU_ONLY OFF)
set(Caffe_HAVE_CUDA TRUE)
set(Caffe_HAVE_CUDNN TRUE)
