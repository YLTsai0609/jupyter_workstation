# 不一定要放在 ~/.bashrc，也可以放在 notebook 中的 os.environ['VARIABLE']
if [ $LD_LIBRARY_PATH ]; then
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
else
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64
fi

if [ $PATH ]; then
    export PATH=$PATH:/usr/local/cuda/bin
else
    export PATH=/usr/local/cuda/bin
fi

if [ $CUDA_HOME ]; then
    export CUDA_HOME=$CUDA_HOME:/usr/local/cuda
else
    export CUDA_HOME=/usr/local/cuda
fi