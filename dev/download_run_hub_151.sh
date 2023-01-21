# run jupyterhub

# volumn-1
	# local machine : /opt/jupyterhub/jupyterhub
	# container : /srv/jupyterhub

# volumn-2
	# local machine : /opt/jupyterhub/home
	# container : /home

docker run -p 8000:8000 -d --name jupyterhub -v /opt/jupyterhub/jupyterhub:/srv/jupyterhub -v /opt/jupyterhub/home:/home --restart=always jupyterhub/jupyterhub:1.5.1 jupyterhub
