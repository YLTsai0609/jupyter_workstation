1. `jupyter_workstation$ docker build -f Dockerfile -t image_name:tag_name`
2. `jupyter_workstation/docker$ sh hub_shell.sh`
   1. to make sure everything works fine (follow by `test.sh`) 
3. `sh deploy.sh` - run the container and mount volumnn