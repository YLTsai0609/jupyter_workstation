
Devlop your infra stuff using docker for quick iterations.

**Use it for development only before the problems are solved. - there are some issue using docker-version jupyter workstation (user mappings in container and host-machine)**
# Getting Start

## Overall Picture

1. `build the image from dockerfile` 
2. `run the image as an container with specified volumn(all things will be setup)`
3. `assign the password for user jupyterhub inside the container`
4. All set! open `host:8000` to enjoy.

## Detail Steps

1. build the image from dockerfile 
   - `username@host:~/path/jupyter_workstation$ bash docker/build_image.sh`
2. run the image as an container with specified volumn(all things will be setup)
   - `username@host:~/path/jupyter_workstation$ bash docker/deploy.sh`
3. assign the password for user jupyterhub inside the container
   - `bash docker.hub_shell.sh`
   - `root@container:path$ passwd jupyterhub`
4. All set! open `host:8000` to enjoy.
   - open your browser and type `host:8000` - your jupyterhub & nbextension & jupytemplate are all set.  