# ref : https://cloud.google.com/sdk/gcloud/reference/compute/instances/create
# gcloud compute instances delete gpu-workstation-test
# lspci | grep 'VGA'
INSTANCE_NAME=$1
GPUTYPE=$2 # nvidia-tesla-k80
GPUCOUNT=$3 # 1

gcloud compute instances create $INSTANCE_NAME \
--machine-type "n1-standard-1" \
--accelerator type=$GPUTYPE,count=$GPUCOUNT \
--metadata-from-file startup-script=install_or_check_gpu_driver.sh \
--zone asia-east1-a \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--boot-disk-size 50GB \
--maintenance-policy TERMINATE \
--restart-on-failure \

# --accelerator type=nvidia-tesla-k80,count=1 \ GPU settings
# --node-project $PROJECT \

# start and stop the instance 
# ref : https://cloud.google.com/compute/docs/instances/stop-start-instance
# gcloud compute instances stop instance_name 