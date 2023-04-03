# ref : https://cloud.google.com/sdk/gcloud/reference/compute/instances/create
# or just start by gcloud command : https://cloud.google.com/deep-learning-vm/docs/pytorch_start_instance
INSTANCE_NAME=$1
GPUTYPE=$2 # nvidia-tesla-k80, nvidia-tesla-t4
GPUCOUNT=$3 # 1

gcloud compute instances create $INSTANCE_NAME \
--machine-type "n1-standard-1" \
--accelerator type=$GPUTYPE,count=$GPUCOUNT \
--metadata-from-file startup-script=install_or_check_gpu_driver.sh \
--zone asia-east1-a \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--boot-disk-size 300GB \
--maintenance-policy TERMINATE \
--restart-on-failure \

# --accelerator type=nvidia-tesla-k80,count=1 \ GPU settings
# --node-project $PROJECT \

# delete
# gcloud compute instances delete gpu-workstation-test

# start and stop the instance 
# gcloud compute instances stop instance_name 