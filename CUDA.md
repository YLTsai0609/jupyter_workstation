# CUDA vs CuDNN vs CUDAToolkit vs NVCC

1. CUDA : 為 GPU 所設計的通用計算平台(C++, with hardware)
2. cuDNN : 為深度學習在 GPU 上運算特別設計的加速軟體(C++)，tensorflow 對此有 dependency， PyTorch 無。
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
   1. Conda 也可以安裝 CudaToolkit，不同的 channel 中有不同的動態檔案，例如 channel - nvidia 一定最完整， conda-forge 次之， tnesorflow 的 channel 則只會有 tf 所需的， pytorch 也只會有 torch 所需的
6. NVCC - Nvidia Cuda Compilier 

# General CUDA Path fining

Pytorch / Tensorflow 都會試著尋找 cdua, compiler 以及 cudnn(tf only)，一般來說 source code 會寫尋找的順序(優先次序)

1. 先看 ENV 中的 CUDA_HOME, CUDA_PATH
2. 沒有的話找 `usr/local/cuda*`
3. 沒有的話找 `which nvcc`， parent folder
4. 可以在自己的系統目錄，或是虛擬環境目錄 : `find . -name *.so | grep cuda`，來找哪裡有 cuda 相關的 so檔案
5. 如果系統有裝，虛擬環境(conda) 也有裝，那麼就必須透過環境變數來設置優先權，有必須理解 tf, torch 對應版本怎麼找 CUDA_PATH, LD_LIBRARY_PATH


# CUDA Main API

主要有兩個 API
1. driver API - 例如 `libcuda.so` 是由 GPU driver installer 安裝 (nvidia-smi 屬於 driver api)
2. runtime API - 例如 `lincudart.so`, `nvcc` 是由 CUDA Toolkit installer 安裝 (nvcc 屬於 runtime api)
3. runtime api 不能比 driver api 更新，否則會不認得對應的 so

# Management 

1. 開發環境、部署環境皆使用 Docker，都裝在 Docker 的系統層
   1. 開發環境 - 開發環境也用 Docker 維運
   2. 部署環境 - 使用對應的 Image，並裝 nvidia2docker，確保 Container 在 WorkerNode 上可以跟 GPU 溝通
2. 開發環境 - 系統裝 cuda driver
   1. 虛擬開發環境 - conda 控制 cudatoolkit, cudnn
   2. 部署環境 - conda 控制 cudatoolkit, cudnn --> 不需使用 docker, 只需要虛擬環境即可

ref : https://blog.csdn.net/qq_41094058/article/details/116207333