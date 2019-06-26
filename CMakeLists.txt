cmake_minimum_required(VERSION 2.8.7)
if(POLICY CMP0046)
  cmake_policy(SET CMP0046 NEW)
endif()
if(POLICY CMP0054)
  cmake_policy(SET CMP0054 NEW)
endif()





# ---[ Caffe project
project(Caffe C CXX)

# ---[ Caffe version
set(CAFFE_TARGET_VERSION "1.0.0" CACHE STRING "Caffe logical version")
set(CAFFE_TARGET_SOVERSION "1.0.0" CACHE STRING "Caffe soname version")
add_definitions(-DCAFFE_VERSION=${CAFFE_TARGET_VERSION})

# ---[ Using cmake scripts and modules
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/Modules)

include(ExternalProject)
include(GNUInstallDirs)

include(cmake/Utils.cmake)
include(cmake/Targets.cmake)
include(cmake/Misc.cmake)
include(cmake/Summary.cmake)
include(cmake/ConfigGen.cmake)

# ---[ Options
caffe_option(CPU_ONLY  "Build Caffe without CUDA support" OFF) # TODO: rename to USE_CUDA
caffe_option(USE_CUDNN "Build Caffe with cuDNN library support" ON IF NOT CPU_ONLY)
caffe_option(USE_NCCL "Build Caffe with NCCL library support" ON)
caffe_option(BUILD_SHARED_LIBS "Build shared libraries" ON)
caffe_option(BUILD_python "Build Python wrapper" ON)
set(python_version "2" CACHE STRING "Specify which Python version to use")
caffe_option(BUILD_matlab "Build Matlab wrapper" OFF IF UNIX OR APPLE)
caffe_option(BUILD_docs   "Build documentation" ON IF UNIX OR APPLE)
caffe_option(BUILD_python_layer "Build the Caffe Python layer" ON)
caffe_option(USE_OPENCV "Build with OpenCV support" ON)
caffe_option(USE_LEVELDB "Build with levelDB" ON)
caffe_option(USE_LMDB "Build with lmdb" ON)
caffe_option(ALLOW_LMDB_NOLOCK "Allow MDB_NOLOCK when reading LMDB files (only if necessary)" OFF)
caffe_option(USE_OPENMP "Link with OpenMP (when your BLAS wants OpenMP and you get linker errors)" OFF)

# This code is taken from https://github.com/sh1r0/caffe-android-lib
caffe_option(USE_HDF5 "Build with hdf5" ON)

#重点：：：：：：：请在这里把自己的anaconda的envs——caffe路径设置在这里，下面是我的路径，请务必更改
set(ENVS_ROUTR /home/geoffrey/.conda/envs/caffe_27)
set(ENVS_INCLUDE /home/geoffrey/.conda/envs/caffe_27/include)
set(ENVS_LIB /home/geoffrey/.conda/envs/caffe_27/lib)
set(ENVS_EXECUTABLE /home/geoffrey/.conda/envs/caffe_27/bin)
####################
#set(NUMPY_INCLUDE lib/python3.6/site-packages/numpy/core/include/)
#set(NUMPY_VERSION 1.11.3)
####################

#3rdparty path
#GLOG
set(GLOG_INCLUDE_DIR ${ENVS_INCLUDE} )
set(GLOG_LIBRARY ${ENVS_LIB}/libglog.so)
#set(GLOG_LIBRARIES ${ENVS_LIB})
#set(GLOG_LIBRARY_DIRS ${ENVS_LIB})

#HDF5
set(HDF5_INCLUDE_DIRS   ${ENVS_INCLUDE})
set(HDF5_LIBRARIES  ${ENVS_LIB}/libhdf5.so  ${ENVS_LIB}/libhdf5_cpp.so ${ENVS_LIB}/libhdf5_fortran.so)
set(HDF5_HL_LIBRARIES  ${ENVS_LIB}/libhdf5_hl.so)

#glags
set(GFLAGS_INCLUDE_DIR   ${ENVS_INCLUDE})
set(GFLAGS_LIBRARY ${ENVS_LIB}/libgflags.so )


#atlas
set(Atlas_CLAPACK_INCLUDE_DIR  ${ENVS_INCLUDE})
set(Atlas_CBLAS_INCLUDE_DIR  ${ENVS_INCLUDE})
set(Atlas_CBLAS_LIBRARY ${ENVS_LIB}/libcblas.so)
set(Atlas_BLAS_LIBRARY ${ENVS_LIB}/libblas.so)
set(Atlas_LAPACK_LIBRARY ${ENVS_LIB}/liblapack.so)

#levelDB
set(LevelDB_INCLUDE  ${ENVS_INCLUDE})
set(LevelDB_LIBRARY ${ENVS_LIB}/libleveldb.so)


#lmdb
set(LMDB_INCLUDE_DIR  ${ENVS_INCLUDE})
set(LMDB_LIBRARIES ${ENVS_LIB}/liblmdb.so)

#protobuf
set(PROTOBUF_INCLUDE_DIR  ${ENVS_INCLUDE})
#set(PROTOBUF_LITE_LIBRARIES ${ENVS_LIB}/libprotobuf-lite.so)
set(Protobuf_LIBRARY  ${ENVS_LIB}/libprotobuf-lite.so ${ENVS_LIB}/libprotoc.so ${ENVS_LIB}/libprotobuf.so)
#set(PROTOBUF_PROTOC_LIBRARIES ${ENVS_LIB}/libprotoc.so)
set(PROTOBUF_PROTOC_EXECUTABLE ${ENVS_EXECUTABLE}/protoc)

#boost
set(Boost_INCLUDE_DIR   ${ENVS_INCLUDE})
set(Boost_LIBRARIES  ${ENVS_LIB})

#MKL
set(MKL_INCLUDE_DIR  ${ENVS_INCLUDE})
set(MKL_LIBRARIES ${ENVS_LIB}/libmkl_avx2.so           
${ENVS_LIB}/libmkl_avx512.so        
${ENVS_LIB}/libmkl_avx.so          
${ENVS_LIB}/libmkl_core.so         
${ENVS_LIB}/libmkl_def.so          
${ENVS_LIB}/libmkl_intel_ilp64.so  
${ENVS_LIB}/libmkl_intel_lp64.so    
${ENVS_LIB}/libmkl_mc3.so           
${ENVS_LIB}/libmkl_mc.so           
${ENVS_LIB}/libmkl_rt.so           
${ENVS_LIB}/libmkl_sequential.so    
${ENVS_LIB}/libmkl_vml_avx2.so        
${ENVS_LIB}/libmkl_vml_avx.so       
${ENVS_LIB}/libmkl_vml_cmpt.so      
${ENVS_LIB}/libmkl_vml_def.so       
${ENVS_LIB}/libmkl_vml_mc2.so       
${ENVS_LIB}/libmkl_vml_mc3.so       
${ENVS_LIB}/libmkl_vml_mc.so)

# NCCL
SET(NCCL_DIR $ENVS_ROUTR)
#find_package(NCCL REQUIRE )
SET(NCCL_INCLUDE_DIR  ${ENVS_INCLUDE})
SET(NCCL_LIBRARIES ${ENVS_LIB}/libnccl.so)


#CUDA
#set(CUDA_DIR  /opt/cuda)
find_package(CUDA REQUIRED)
if (NOT CUDA_FOUND)
  message(STATUS "CUDA not found !!!!!!!!!!!!!!!!!!!!!")
endif(NOT CUDA_FOUND)

#openblas
SET(OpenBLAS_INCLUDE_DIR  ${ENVS_INCLUDE})
SET(OpenBLAS_LIB ${ENVS_LIB})

#snappy
set(Snappy_INCLUDE_DIR  ${ENVS_INCLUDE})
set(Snappy_LIBRARIES ${ENVS_LIB}/libsnappy.so)

# message("-- Warning: LIBCXX = ${LIBCXX}")
# if(LIBCXX STREQUAL "libstdc++11")
#     add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
# 如果最后link报protocbuf错误请添加该指令
add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
# endif()

# ---[ Dependencies
include(cmake/Dependencies.cmake)

# ---[ Flags
if(UNIX OR APPLE)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -Wall")
endif()

caffe_set_caffe_link()

if(USE_libstdcpp)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
  message("-- Warning: forcing libstdc++ (controlled by USE_libstdcpp option in cmake)")
endif()

# ---[ Warnings
caffe_warnings_disable(CMAKE_CXX_FLAGS -Wno-sign-compare -Wno-uninitialized)

# ---[ Config generation
configure_file(cmake/Templates/caffe_config.h.in "${PROJECT_BINARY_DIR}/caffe_config.h")

# ---[ Includes
set(Caffe_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
set(Caffe_SRC_DIR ${PROJECT_SOURCE_DIR}/src)
include_directories(${PROJECT_BINARY_DIR})

# ---[ Includes & defines for CUDA

# cuda_compile() does not have per-call dependencies or include pathes
# (cuda_compile() has per-call flags, but we set them here too for clarity)
#
# list(REMOVE_ITEM ...) invocations remove PRIVATE and PUBLIC keywords from collected definitions and include pathes

if(HAVE_CUDA)
  # pass include pathes to cuda_include_directories()
  set(Caffe_ALL_INCLUDE_DIRS ${Caffe_INCLUDE_DIRS})
  list(REMOVE_ITEM Caffe_ALL_INCLUDE_DIRS PRIVATE PUBLIC)
  cuda_include_directories(${Caffe_INCLUDE_DIR} ${Caffe_SRC_DIR} ${Caffe_ALL_INCLUDE_DIRS})

  # add definitions to nvcc flags directly
  set(Caffe_ALL_DEFINITIONS ${Caffe_DEFINITIONS})
  list(REMOVE_ITEM Caffe_ALL_DEFINITIONS PRIVATE PUBLIC)
  list(APPEND CUDA_NVCC_FLAGS ${Caffe_ALL_DEFINITIONS})
endif()


# ---[ Subdirectories
add_subdirectory(src/gtest)
add_subdirectory(src/caffe)
add_subdirectory(tools)
add_subdirectory(examples)
add_subdirectory(python)
add_subdirectory(matlab)
add_subdirectory(docs)

# ---[ Linter target
add_custom_target(lint COMMAND ${CMAKE_COMMAND} -P ${PROJECT_SOURCE_DIR}/cmake/lint.cmake)

# ---[ pytest target
if(BUILD_python)
  add_custom_target(pytest COMMAND python${python_version} -m unittest discover -s caffe/test WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/python )
  add_dependencies(pytest pycaffe)
endif()

# ---[ uninstall target
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Uninstall.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/cmake/Uninstall.cmake
    IMMEDIATE @ONLY)

add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P
    ${CMAKE_CURRENT_BINARY_DIR}/cmake/Uninstall.cmake)

# ---[ Configuration summary
caffe_print_configuration_summary()

# ---[ Export configs generation
caffe_generate_export_configs()


#检查libcaffe.so 的link路径是否设置到miniconda的envs中
message("Caffe_INCLUDES: ${Caffe_INCLUDE_DIRS}")
message("Caffe_LINKER_LIBS: ${Caffe_LINKER_LIBS}")

