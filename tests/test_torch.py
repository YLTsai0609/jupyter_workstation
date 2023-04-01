"""
pip install only due to we already install cudatoolkit NVIDIA version
1. conda create --name torch11 python=3.7 -y
2. conda activate torch11
3. pip install torch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 ipython

https://pytorch.org/get-started/previous-versions/
"""
import torch

print(
    torch.cuda.is_available(),
    torch.cuda.device_count(),
    torch.cuda.get_device_name(0),
    torch.version.cuda,  # version when compiled
)
