# ref : https://cloud.google.com/sdk/gcloud/reference/compute/instances/create
INSTANCE_NAME=$1

gcloud compute instances create $INSTANCE_NAME \
--machine-type n2-standard-4 \
--zone asia-east1-a \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--boot-disk-size 50GB \
--maintenance-policy TERMINATE \
--restart-on-failure \

# --accelerator type=nvidia-tesla-k80,count=1 \ GPU settings
# --node-project $PROJECT \

# delete instance
# gcloud compute instances delete instance_name

# start and stop the instance 
# ref : https://cloud.google.com/compute/docs/instances/stop-start-instance
# gcloud compute instances stop instance_name 