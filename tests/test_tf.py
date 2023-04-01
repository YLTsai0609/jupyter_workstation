"""
since we install cudatoolkit, we still lack of cudnn, let conda fill this
https://www.tensorflow.org/install/pip

1. conda create --name tf_24 python=3.7 cudnn -c anaconda 
TODO 2. conda activate tf_24
TODO 3. pip install nvidia-cudnn-cu11==8.2.4.163 tensorflow==2.4.0 ipython
"""
import tensorflow as tf

print("Num GPUs Available: ", len(tf.config.list_physical_devices("GPU")))
