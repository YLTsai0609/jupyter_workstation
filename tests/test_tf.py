"""
when using tensorflow

1. control cuda source code and cudnn by conda
2. install python dependency by pip

research which version is needed

1. cudatoolkit lastest version < driver version (nvidia-smi)
2. matched cudnn version
3. matched tensorflow version

Example : 

1. (cuda114_cudnn_81) joetsai@gpu-workstation-driver-only:~$ conda create -n cuda114_cudnn_81 python=3.9 cudatoolkit=11.2 cudnn=8.1.0 -c conda-forge
2. (cuda114_cudnn_81) joetsai@gpu-workstation-driver-only:~$ pip install tensorflow==2.5.*
3. (cuda114_cudnn_81) joetsai@gpu-workstation-driver-only:~$ python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

"""
import tensorflow as tf

print("Num GPUs Available: ", len(tf.config.list_physical_devices("GPU")))
