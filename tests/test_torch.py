"""
when using torch

1. control cuda source code by conda
2. install python dependency by pip

research which version is needed

1. cudatoolkit lastest version < driver version (nvidia-smi)
3. matched torch version, ref : https://pytorch.org/get-started/previous-versions/

Example : 

1. (cuda114_cudnn_81) joetsai@gpu-workstation-driver-only:~$ conda create -n cuda1131 python=3.9 cudatoolkit=11.3.1 -c conda-forge
2. (cuda1131) joetsai@gpu-workstation-driver-only:~$ pip install torch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0
3. (cuda114_cudnn_81) joetsai@gpu-workstation-driver-only:~$ python -c "import torch; print(torch.cuda.is_available()); print(torch.cuda.device_count()); print(torch.cuda.get_device_name(0));"

"""
import torch

print(
    torch.cuda.is_available(),
    torch.cuda.device_count(),
    torch.cuda.get_device_name(0),
    torch.version.cuda,  # version when compiled
)
