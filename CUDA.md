# CUDA vs CuDNN vs CUDAToolkit vs NVCC

1. CUDA : 為 GPU 所設計的通用計算平台(C++, with hardware)
2. cudnn : 為深度學習在 GPU 上運算特別設計的加速軟體(C++)
3. CUDA toolkit (nvidia) : CUDA 的完整工具安裝包，包含
   1. Nvidia driver
   2. CUDA Libraries
      1. include - 
      2. bin - binary file
      3. lib - libraries
      4. src - source code
      5. doc / help / samples
   3. CUDA Compilier
   4. CUDA IDE, Debugger, Document
   5. CUDA Driver 向下相容
4. CUDA toolkit (Pytorch) : CUDA 的**不完整**工具安裝包，主要包含 Torch 或使用到的 c++ 檔案 和 so，不安裝 driver
5. CUDA Toolkit (Conda)
6. NVCC - Nvidia Cuda Compilier 

# Pytoch --> CUDA

TODO : add here https://blog.csdn.net/qq_41094058/article/details/116207333