# caffe_mutil_label_build_by_anaconda
使用cmake, 头文件和库基于anaconda虚拟环境, 编译修改好的支持多标签的caffe和pycaffe.

---------------------------------

caffe编译是一个繁琐个过程, 或多或少会遇到各种各样的问题, 如我[caffe编译错误记录](https://www.cnblogs.com/geoffreyone/p/10690920.html)记录了遇到过得一部分问题. 原因是因为每个依赖如`openblas`, `protobuf`都需要编译**特定版本**, 每台电脑装的依赖库各不相同, **环境变量**也有冲突的情况(如system和anaconda). 于是我一直想找一种简单方便的caffe编译方法, 可以避免上述的问题. 也就有了今天的内容, 使用anaconda虚拟环境编译caffe.

------------------------
#### 一些说明:
1. anaconda虚拟环境可以把环境和系统隔离, 相当于浓缩版`/usr/lib`+`/usr/include`, 在环境中安装包使用`conda install {包名称}=版本号`命令, 可以很方便的修改环境依赖;
2. 我的caffe是添加了多标签的部分, 即label可以有多个, 可以直接用我修改好的caffe开始编译;
3. 项目整体      
------------------------        
        
# 1. 编译过程说明:
## (1) 生成anaconda虚拟环境
我编译完成后, 把用到的conda虚拟环境输出成了.yml文件.  重新编译时, 可以使用`conda env create -f caffe_36.yml`生成和我一模一样的虚拟环境,而不需要一个一个包重新安装. 

## (2) 激活虚拟环境
环境名我定的名字是`caffe_36`, 代表python版本是3.6, 用于编译caffe环境. 如果使用第一步命令生成环境, 那么可以运行一下`source`命令激活.
`source activate caffe_36`

## (3) cmake
不使用make, 而是用camke进行编译, 一方面可以跨平台, 另一方面cmake更加通俗易懂.
 
执行如下命令:
```bash
mkdir build 
cd build 
cmake ..
```
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623124421612-1208150698.png)

camke过程如图:
```
CMake Warning (dev) at cmake/Misc.cmake:32 (set):
  implicitly converting 'BOOLEAN' to 'STRING' type.
Call Stack (most recent call first):
  CMakeLists.txt:29 (include)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Boost version: 1.60.0
-- Found the following Boost libraries:
--   system
--   thread
--   filesystem
--   chrono
--   date_time
--   atomic
-- Found gflags  (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libgflags.so)
-- Found glog    (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libglog.so)
-- Found PROTOBUF Compiler: /home/geoffrey/.conda/envs/caffe_27/bin/protoc
-- HDF5: Using hdf5 compiler wrapper to determine C configuration
-- HDF5: Using hdf5 compiler wrapper to determine CXX configuration
-- Found lmdb    (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/liblmdb.so)
-- Found LevelDB (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libleveldb.so)
-- Found Snappy  (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libsnappy.so)
-- CUDA detected: 10.1
-- Found cuDNN: ver. 7.6.0 found (include: /usr/include, library: /usr/lib/libcudnn.so)
-- Added CUDA NVCC flags for: sm_61
-- OpenCV found (/usr/local/share/OpenCV)
-- Found Atlas (include: /home/geoffrey/.conda/envs/caffe_27/include library: /home/geoffrey/.conda/envs/caffe_27/lib/libblas.so lapack: /home/geoffrey/.conda/envs/caffe_27/lib/liblapack.so
-- NumPy ver. 1.7.1 found (include: /home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include)
-- Boost version: 1.60.0
-- Found the following Boost libraries:
--   python
-- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE) 
-- 
-- ******************* Caffe Configuration Summary *******************
-- General:
--   Version           :   1.0.0
--   Git               :   unknown
--   System            :   Linux
--   C++ compiler      :   /usr/bin/c++
--   Release CXX flags :   -O3 -DNDEBUG -fPIC -Wall -Wno-sign-compare -Wno-uninitialized
--   Debug CXX flags   :   -g -fPIC -Wall -Wno-sign-compare -Wno-uninitialized
--   Build type        :   Release
-- 
--   BUILD_SHARED_LIBS :   ON
--   BUILD_python      :   ON
--   BUILD_matlab      :   OFF
--   BUILD_docs        :   ON
--   CPU_ONLY          :   OFF
--   USE_OPENCV        :   ON
--   USE_LEVELDB       :   ON
--   USE_LMDB          :   ON
--   USE_NCCL          :   OFF
--   ALLOW_LMDB_NOLOCK :   OFF
--   USE_HDF5          :   ON
-- 
-- Dependencies:
--   BLAS              :   Yes (Atlas)
--   Boost             :   Yes (ver. 1.60)
--   glog              :   Yes
--   gflags            :   Yes
--   protobuf          :   Yes (ver. 2.5.0)
--   lmdb              :   Yes (ver. 0.9.23)
--   LevelDB           :   Yes (ver. 1.19)
--   Snappy            :   Yes (ver. ..)
--   OpenCV            :   Yes (ver. 3.4.6)
--   CUDA              :   Yes (ver. 10.1)
-- 
-- NVIDIA CUDA:
--   Target GPU(s)     :   Auto
--   GPU arch(s)       :   sm_61
--   cuDNN             :   Yes (ver. 7.6.0)
-- 
-- Python:
--   Interpreter       :   /home/geoffrey/.conda/envs/caffe_27/bin/python2.7 (ver. 2.7.16)
--   Libraries         :   /home/geoffrey/.conda/envs/caffe_27/lib/libpython2.7.so (ver 2.7.16)
--   NumPy             :   /home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include (ver 1.7.1)
-- 
-- Documentaion:
--   Doxygen           :   No
--   config_file       :   
-- 
-- Install:
--   Install path      :   /home/geoffrey/caffe/release/install
-- 
Caffe_INCLUDES: PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/opt/cuda/include;PUBLIC;/usr/include;PUBLIC;/usr/local/include;/usr/local/include/opencv;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;/home/geoffrey/.conda/envs/caffe_27/include;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/include/python2.7;/home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include
Caffe_LINKER_LIBS: PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_system.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_thread.so;-lpthread;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_filesystem.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_chrono.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_date_time.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_atomic.so;PRIVATE;-lpthread;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libglog.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libgflags.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf-lite.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotoc.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_27/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_27/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/liblmdb.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libleveldb.so;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/lib/libsnappy.so;PUBLIC;/opt/cuda/lib64/libcudart.so;/opt/cuda/lib64/libcurand.so;/opt/cuda/lib64/libcublas.so;PUBLIC;/usr/lib/libcudnn.so;PUBLIC;opencv_core;opencv_highgui;opencv_imgproc;opencv_imgcodecs;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/liblapack.so;/home/geoffrey/.conda/envs/caffe_27/lib/libcblas.so;/home/geoffrey/.conda/envs/caffe_27/lib/libblas.so;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/lib/libpython2.7.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_python.so
-- Configuring done
-- Generating done
-- Build files have been written to: /home/geoffrey/caffe/release

```
## (4) 编译
```
make all -j8
```
如果出现一下字样, 编译成功.
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623120835326-777334207.png)

用pycaffe测试一下:
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623121118889-1799973623.png) 

# 2. 问题搜集

1. ".Doxyfile" cannot be read.`问题
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190621132027822-991494759.png)
解决方法:
Doxyfile是文档系统, 卸载掉本地的即可.

2. 未定义的应用
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623124015132-675879207.png)
安装了`libopencv`, 但是缺少头文件, 我`conda install opencv`解决.
