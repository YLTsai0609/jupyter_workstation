# modified
c.JupyterHub.admin_access = True
c.JupyterHub.admin_users = {'jupyterhub'}
# add

ref : https://stackoverflow.com/questions/50729977/create-system-users-true-doesnt-work
c.LocalAuthenticator.create_system_users = True
