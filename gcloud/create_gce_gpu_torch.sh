# https://cloud.google.com/deep-learning-vm/docs/pytorch_start_instance
# list image family by : gcloud compute images list --project deeplearning-platform-release --no-standard-images
INSTANCE_NAME=$1
GPUTYPE=$2 # nvidia-tesla-k80
GPUCOUNT=$3 # 1
IMAGE_FAMILY=$4 # pytorch-latest-cu113

gcloud compute instances create $INSTANCE_NAME \
--machine-type "n1-standard-1" \
--accelerator type=$GPUTYPE,count=$GPUCOUNT \
--metadata="install-nvidia-driver=True" \
--zone asia-east1-a \
--image-family $IMAGE_FAMILY \
--image-project deeplearning-platform-release \
--boot-disk-size 50GB \
--maintenance-policy TERMINATE \
--restart-on-failure \

# --accelerator type=nvidia-tesla-k80,count=1 \ GPU settings
# --node-project $PROJECT \

# delete
# gcloud compute instances delete gpu-workstation-test

# start and stop the instance 
# gcloud compute instances stop instance_name 