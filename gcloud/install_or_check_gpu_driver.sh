#!/bin/bash
# This scripts and install_gpu_driver.py is maintained by Google
# https://github.com/GoogleCloudPlatform/compute-gpu-installation/blob/main/linux/startup_script.sh
# official document : https://cloud.google.com/compute/docs/gpus/install-drivers-gpu
if which nvidia-smi
then
  echo "GPU DRIVER detected" 
  exit
fi

mkdir -p /opt/google
cd /opt/google || exit

if ! which python3 > /dev/null
then
  if which yum > /dev/null
  then
    yum install -y python3
  else
    apt-get install -y python3
  fi
fi

curl https://raw.githubusercontent.com/GoogleCloudPlatform/compute-gpu-installation/main/linux/install_gpu_driver.py --output install_gpu_driver.py
python3 install_gpu_driver.py
echo "GPU DRIVER Installed!"