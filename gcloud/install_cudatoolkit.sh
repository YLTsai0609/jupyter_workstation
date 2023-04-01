# could install this for all cuda thing (driver, compiler, source code)
# need check specified version with your GPU

# https://developer.nvidia.com/cuda-11-4-4-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=18.04&target_type=runfile_local

mkdir -p /opt/cudatoolkit

sudo wget https://developer.download.nvidia.com/compute/cuda/11.4.4/local_installers/cuda_11.4.4_470.82.01_linux.run

sudo sh cuda_11.4.4_470.82.01_linux.run

# will take about 10 ~ 20 mins