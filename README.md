caffe编译是一个繁琐个过程, 或多或少会遇到各种各样的问题, 如我[caffe编译错误记录](https://www.cnblogs.com/geoffreyone/p/10690920.html)记录了遇到过得一部分问题. 原因是因为每个依赖如`openblas`, `protobuf`都需要编译**特定版本**, 每台电脑装的依赖库各不相同, **环境变量**也有冲突的情况(如system和anaconda). 于是我一直想找一种简单方便的caffe编译方法, 可以避免上述的问题. 也就有了今天的内容, 使用anaconda虚拟环境编译caffe.

------------------------
#### 一些说明:
1. anaconda虚拟环境可以把环境和系统隔离, 相当于浓缩版`/usr/lib`+`/usr/include`, 在环境中安装包使用`conda install {包名称}=版本号`命令, 可以很方便的修改环境依赖;
2. 测试系统是Manjaro Linux, 但是使用anaconda+cmake, 应该和系统没有关系. 即使用其他linux系统或者windows也可以;
3. anaconda环境名称为caffe_27．　python 3在编译完成caffe后, pychaffe编译出错. 于是换成了python2.7. python3我会后续补充;
4. 我的caffe是添加了多标签的部分, 即label可以有多个, 可以直接用我修改好的caffe开始编译;
5. cuda任然需要本地安装, 我的是Manjaro Linux, 使用`pacman -S cuda`安装. 
6. 项目整体只在本地测试过, 如果有问题还请指出, 我会进一步完善.    
7. NCCL, GPU默认开启，如果需要关闭可以更改 CmakeList.txt相关位置．   

[**>>>>> GitHub项目链接**](https://github.com/GeoffreyHub/caffe_mutil_label_build_by_anaconda/blob/master/README.md)   

     
------------------------            
                
# 1. 编译过程说明:
## (1) 生成anaconda虚拟环境
我编译完成后, 把用到的conda虚拟环境输出成了.yml文件.  重新编译时, 可以使用`conda env create -f caffe_36.yml`生成和我一模一样的虚拟环境,而不需要一个一个包重新安装. 

## (2) 激活虚拟环境
环境名我定的名字是`caffe_ 27`, 代表python版本是2.7(python3.6环境编译可以通过, 但是pycaffe编辑通过, 于是后来换成了python 2.7, ), 用于编译caffe环境. 如果使用第一步命令生成环境, 那么可以运行一下`source`命令激活.
`source activate caffe_27`

## (3) cmake
不使用make, 而是用camke进行编译, 一方面可以跨平台, 另一方面cmake更加通俗易懂.
 需要进行如下一些修改:
##### <1> 修改虚拟环境路径:
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623125903295-883994183.png)
##### <2> 如果cuda有问题, 手动添加cuda路径:
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623130107847-1768186620.png)

执行如下命令:
```bash
mkdir build 
cd build 
cmake ..
```
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190625194244408-886675975.png)


camke过程如图:
```
-- The C compiler identification is GNU 8.3.0
-- The CXX compiler identification is GNU 8.3.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
CMake Warning (dev) at cmake/Misc.cmake:32 (set):
  implicitly converting 'BOOLEAN' to 'STRING' type.
Call Stack (most recent call first):
  CMakeLists.txt:29 (include)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Looking for pthread.h
-- Looking for pthread.h - found
-- Looking for pthread_create
-- Looking for pthread_create - not found
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - found
-- Found Threads: TRUE  
-- Found CUDA: /opt/cuda (found version "10.1") 
-- Boost version: 1.60.0
-- Found the following Boost libraries:
--   system
--   thread
--   filesystem
--   chrono
--   date_time
--   atomic
-- Found GFlags: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found gflags  (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libgflags.so)
-- Found Glog: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found glog    (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libglog.so)
-- Found Protobuf: /home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf-lite.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotoc.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf.so (found version "2.5.0") 
-- Found PROTOBUF Compiler: /home/geoffrey/.conda/envs/caffe_27/bin/protoc
-- HDF5: Using hdf5 compiler wrapper to determine C configuration
-- HDF5: Using hdf5 compiler wrapper to determine CXX configuration
-- Found HDF5: /home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_27/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so (found version "1.10.2") found components:  HL 
-- Found LMDB: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found lmdb    (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/liblmdb.so)
-- Found LevelDB: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found LevelDB (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libleveldb.so)
-- Found Snappy: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found Snappy  (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libsnappy.so)
-- CUDA detected: 10.1
-- Found cuDNN: ver. 7.6.0 found (include: /usr/include, library: /usr/lib/libcudnn.so)
-- Added CUDA NVCC flags for: sm_61
-- Found NCCL: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found NCCL    (include: /home/geoffrey/.conda/envs/caffe_27/include, library: /home/geoffrey/.conda/envs/caffe_27/lib/libnccl.so)
-- OpenCV found (/home/geoffrey/.conda/envs/caffe_27/share/OpenCV)
-- Found Atlas: /home/geoffrey/.conda/envs/caffe_27/include  
-- Found Atlas (include: /home/geoffrey/.conda/envs/caffe_27/include library: /home/geoffrey/.conda/envs/caffe_27/lib/libblas.so lapack: /home/geoffrey/.conda/envs/caffe_27/lib/liblapack.so
-- Found PythonInterp: /home/geoffrey/.conda/envs/caffe_27/bin/python2.7 (found suitable version "2.7.16", minimum required is "2.7") 
-- Found PythonLibs: /home/geoffrey/.conda/envs/caffe_27/lib/libpython2.7.so (found suitable version "2.7.16", minimum required is "2.7") 
-- Found NumPy: /home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include (found suitable version "1.8.2", minimum required is "1.7.1") 
-- NumPy ver. 1.8.2 found (include: /home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include)
-- Boost version: 1.60.0
-- Found the following Boost libraries:
--   python
-- Could NOT find Doxygen (missing: DOXYGEN_EXECUTABLE) 
-- Found Git: /usr/bin/git (found version "2.22.0") 
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
--   USE_NCCL          :   ON
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
--   OpenCV            :   Yes (ver. 3.4.2)
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
--   NumPy             :   /home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include (ver 1.8.2)
-- 
-- Documentaion:
--   Doxygen           :   No
--   config_file       :   
-- 
-- Install:
--   Install path      :   /home/geoffrey/caffe/build/install
-- 
Caffe_INCLUDES: PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/include;PUBLIC;/opt/cuda/include;PUBLIC;/usr/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;/home/geoffrey/.conda/envs/caffe_27/include/opencv;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include;/home/geoffrey/.conda/envs/caffe_27/include;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/include/python2.7;/home/geoffrey/.conda/envs/caffe_27/lib/python2.7/site-packages/numpy/core/include;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/include
Caffe_LINKER_LIBS: PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_system.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_thread.so;-lpthread;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_filesystem.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_chrono.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_date_time.so;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_atomic.so;PRIVATE;-lpthread;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libglog.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libgflags.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf-lite.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotoc.so;/home/geoffrey/.conda/envs/caffe_27/lib/libprotobuf.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_27/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5.so;/usr/lib/librt.so;/usr/lib/libpthread.so;/home/geoffrey/.conda/envs/caffe_27/lib/libz.so;/usr/lib/libdl.so;/usr/lib/libm.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl_cpp.so;/home/geoffrey/.conda/envs/caffe_27/lib/libhdf5_hl.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/liblmdb.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libleveldb.so;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/lib/libsnappy.so;PUBLIC;/opt/cuda/lib64/libcudart.so;/opt/cuda/lib64/libcurand.so;/opt/cuda/lib64/libcublas.so;PUBLIC;/usr/lib/libcudnn.so;/home/geoffrey/.conda/envs/caffe_27/lib/libnccl.so;PUBLIC;opencv_core;opencv_highgui;opencv_imgproc;opencv_imgcodecs;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/liblapack.so;/home/geoffrey/.conda/envs/caffe_27/lib/libcblas.so;/home/geoffrey/.conda/envs/caffe_27/lib/libblas.so;PRIVATE;/home/geoffrey/.conda/envs/caffe_27/lib/libpython2.7.so;PUBLIC;/home/geoffrey/.conda/envs/caffe_27/lib/libboost_python.so
-- Configuring done
-- Generating done
-- Build files have been written to: /home/geoffrey/caffe/build

```
## (4) 编译
```
make all -j8
```
如果出现一下字样, 编译成功.
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190625193726673-991766634.png)



用pycaffe测试一下:
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190625193959837-357351358.png)


# 2. 问题搜集

1. ".Doxyfile" cannot be read.`问题
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190621132027822-991494759.png)
解决方法:
Doxyfile是文档系统, 卸载掉本地的即可.

2. 未定义的应用
![](https://img2018.cnblogs.com/blog/1430038/201906/1430038-20190623124015132-675879207.png)
安装了`libopencv`, 但是缺少头文件, 我`conda install opencv`解决.
