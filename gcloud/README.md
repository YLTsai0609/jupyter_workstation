# gcloud

To simplify user management - without mapping host-machine users to jupyterhub swarmed user(in the container), A simple way is use GCE as a deployment directly

steps:

1. copy command from dockerfile jupyterhub 1.5.1
2. add follow commands to install jupyterhub
3. gcloud create compute engine instance
4. `sudo -s`
5. `bash install_dockerhub_151.sh`
6. `set service_dockerhub`

NOTE: develop in docker is still faster = )