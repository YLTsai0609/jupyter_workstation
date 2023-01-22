# modified
c.JupyterHub.admin_access = True
c.JupyterHub.admin_users = {'jupyterhub'}
# add

# ref : https://stackoverflow.com/questions/50729977/create-system-users-true-doesnt-work
c.LocalAuthenticator.create_system_users = True

# system-wised extension

import os
os.environ['JUPYTER_CONFIG_DIR'] = '/usr/local/etc/jupyter/nbconfig'
c.Spawner.env_keep.append('JUPYTER_CONFIG_DIR')