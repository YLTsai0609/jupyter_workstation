# container name workstation_v1
# image:tag workstation_cpu:v1
# command : N/A
docker run -p 8000:8000 -d --name workstation_v1 -v /opt/jupyterhub/jupyterhub:/srv/jupyterhub -v /opt/jupyterhub/home:/home --restart=always  workstation_cpu:v1 
