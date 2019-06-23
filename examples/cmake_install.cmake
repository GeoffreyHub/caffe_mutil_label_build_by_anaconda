# Install script for directory: /home/geoffrey/caffe/examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/geoffrey/caffe/release/install")
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
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data"
         RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/geoffrey/caffe/release/examples/cifar10/convert_cifar_data")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data"
         OLD_RPATH "/home/geoffrey/caffe/release/lib:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64::::::::::"
         NEW_RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_cifar_data")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification"
         RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/geoffrey/caffe/release/examples/cpp_classification/classification")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification"
         OLD_RPATH "/home/geoffrey/caffe/release/lib:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64::::::::::"
         NEW_RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/classification")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data"
         RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/geoffrey/caffe/release/examples/mnist/convert_mnist_data")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data"
         OLD_RPATH "/home/geoffrey/caffe/release/lib:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64::::::::::"
         NEW_RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_data")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data"
         RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/geoffrey/caffe/release/examples/siamese/convert_mnist_siamese_data")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data"
         OLD_RPATH "/home/geoffrey/caffe/release/lib:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64::::::::::"
         NEW_RPATH "/home/geoffrey/caffe/release/install/lib64:/home/geoffrey/.conda/envs/caffe_36/lib:/home/geoffrey/.conda/envs/caffe_27/lib:/opt/cuda/lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/convert_mnist_siamese_data")
    endif()
  endif()
endif()

