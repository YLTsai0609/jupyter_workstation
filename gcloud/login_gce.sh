INSTANCE_NAME=$1
PROJECT=$2

gcloud compute ssh $INSTANCE_NAME --zone asia-east1-a --project $PROJECT

# If agent forwarding
# gcloud compute ssh --ssh-flag="-A" $INSTANCE_NAME --zone asia-east1-a --project $PROJECT