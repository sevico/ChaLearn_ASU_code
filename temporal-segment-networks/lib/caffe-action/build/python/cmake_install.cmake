# Install script for directory: /home/s03/swk/temporal-segment-networks/lib/caffe-action/python

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python" TYPE FILE FILES
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/bn_convert_style.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/classify.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/convert_to_fully_conv.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/detect.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/draw_net.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/gen_bn_inference.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/polyak_average.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/requirements.txt"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/caffe" TYPE FILE FILES
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/__init__.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/classifier.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/detector.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/draw.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/io.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/net_spec.py"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/pycaffe.py"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so"
         RPATH "/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/install/lib:/usr/local/lib:/usr/lib/x86_64-linux-gnu/hdf5/serial/lib:/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/caffe" TYPE SHARED_LIBRARY FILES "/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/lib/_caffe.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so"
         OLD_RPATH "/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/lib:/usr/local/lib:/usr/lib/x86_64-linux-gnu/hdf5/serial/lib:/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib::::::::"
         NEW_RPATH "/home/s03/swk/temporal-segment-networks/lib/caffe-action/build/install/lib:/usr/local/lib:/usr/lib/x86_64-linux-gnu/hdf5/serial/lib:/home/s03/swk/temporal-segment-networks/3rd-party/opencv-2.4.13/build/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/caffe/_caffe.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/caffe" TYPE DIRECTORY FILES
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/imagenet"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/proto"
    "/home/s03/swk/temporal-segment-networks/lib/caffe-action/python/caffe/test"
    )
endif()

