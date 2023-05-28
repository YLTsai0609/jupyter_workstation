# Jupyter WorkStation

Jupyterhub + nbextension + templates + GPU driver support 

<img src='./assets/hub_arct.png'></img>

[Deploy on GCE](gcloud/README.md)

[Develop on docker](docker/README.md)

# Techniqual Details

1. use jupyterhub 1.5.1 for stability
2. use LocalAuthenticator (create user in system)
3. put `jupyterhub_config.py` into `srv/jupyterhub/jupyterhub_config.py`
4. (GCE) deploy jupyterhub.service from `/opt/jupyterhub/etc/systemd/jupyterhub.service` to `/etc/systemd/system/jupyterhub.service` (soft link)


# User Management

## add user

### Docker
* by jupyterhub GUI (without password)
* root `useradd` username (X) - wrong folder path
* root `passwd` userpassword

### GCE
* root `useradd` username (X) - wrong folder path
* root `passwd` userpassword


## delete user
### Docker
* root userdel uname 
* root userdel -r uname (folders & buffers)

### GCE

* be careful! - we shouldn't delete any user registered on the workstation.

ref : https://blog.csdn.net/weixin_48114253/article/details/117548513

## Change to a user and sudo privileges

* `sudo --login` - login to super user
* `sudo deluser username sudo google-sudoers` take out user sudo and google-sudoers privileges
* `su - test` - Switch to test and simulate a full login shell: (need password)
  * `sudo ls` - [sudo] password for test:
  * test is not in the sudoers file.  This incident will be reported.
    ```
    apt-get install
    E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
    E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
    ```
* `sudo usermod -aG sudo username` - given sudo access
* `groups username` - check user with permission group

## FireWall

* [`tldr ufw`](https://noob.tw/ufw/)
* `ufw allow from a.b.c.d to any port 22` - allow a.b.c.d to access port 22
* `ufw status`

# GCE Workstation checklist

- [x] - GCE with GPU Driver and GPU
- [x] - Jupyterhub on root, deploy by `systemctl service` and JupyterTemplate, setup jupyterhub admin
- [x] setup develop user without sudo (jupyteradd and ssh users)
- [x] - [static IP](https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#console)
- [x] - service account, check bigquery accessible
- [x] - conda environment, test tf and torch
- [ ] - modified jupyter template

**for developer**

- [ ] - ssh for workstation and ssh-agent on workstation
- [ ] - setup repo `conda create .venv`, `.venv/bin/pip install pyenv`, `pipenv sync`

# NOTE

* pre-study on GCE : 4hr
* develop using docker : 2+4 hr
* develop using gcloud : 2+3 hr
* GPU setup on gcloud : 3 hr
* CUDA, CUDAToolKit, PyTorch : 4hr + 2hr
* Total : 15hr
