# ref : https://jupyterhub.readthedocs.io/en/1.2.0/installation-guide-hard.html

sudo mkdir -p /opt/jupyterhub/etc/systemd

sudo cp jupyterhub.service /opt/jupyterhub/etc/systemd

# link service to /etc/systemd/system/jupyterhub.service
sudo ln -s /opt/jupyterhub/etc/systemd/jupyterhub.service /etc/systemd/system/jupyterhub.service

sudo systemctl daemon-reload

# enable service when boot
sudo systemctl enable jupyterhub.service

sudo systemctl status jupyterhub.service

# validate by sudo lsof -i -P -n | grep LISTEN
# get external up : curl ifconfig.me.