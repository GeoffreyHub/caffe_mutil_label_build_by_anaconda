#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "caffe" for configuration "Release"
set_property(TARGET caffe APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(caffe PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "caffeproto;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_system.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_thread.so;-lpthread;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_filesystem.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_chrono.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_date_time.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_atomic.so;/home/geoffrey/.conda/envs/caffe_27/lib/libglog.so;/home/geoffrey/.conda/envs/caffe_27/lib/libgflags.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf-lite.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotoc.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_36/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5_hl_cpp.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5_hl.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_36/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5_hl_cpp.so;/home/geoffrey/.conda/envs/caffe_36/lib/libhdf5_hl.so;/home/geoffrey/.conda/envs/caffe_27/lib/liblmdb.so;/home/geoffrey/.conda/envs/caffe_27/lib/libleveldb.so;/opt/cuda/lib64/libcudart.so;/opt/cuda/lib64/libcurand.so;/opt/cuda/lib64/libcublas.so;/usr/lib/libcudnn.so;opencv_core;opencv_highgui;opencv_imgproc;opencv_imgcodecs;/home/geoffrey/.conda/envs/caffe_27/lib/liblapack.so;/home/geoffrey/.conda/envs/caffe_27/lib/libcblas.so;/home/geoffrey/.conda/envs/caffe_27/lib/libblas.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_python.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libcaffe.so.1.0.0"
  IMPORTED_SONAME_RELEASE "libcaffe.so.1.0.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS caffe )
list(APPEND _IMPORT_CHECK_FILES_FOR_caffe "${_IMPORT_PREFIX}/lib64/libcaffe.so.1.0.0" )

# Import target "caffeproto" for configuration "Release"
set_property(TARGET caffeproto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(caffeproto PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf-lite.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotoc.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libcaffeproto.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS caffeproto )
list(APPEND _IMPORT_CHECK_FILES_FOR_caffeproto "${_IMPORT_PREFIX}/lib64/libcaffeproto.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
