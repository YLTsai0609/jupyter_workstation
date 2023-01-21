chmod -R 664 /home/
cd /home
mkdir jupyterhub

# the foler jupyterhub
# change owner to jupyterhub
# change group to jupyterhub
# recursively

chown jupyterhub:jupyterhub jupyterhub -R
