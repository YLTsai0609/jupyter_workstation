# gcloud

To simplify user management - without mapping host-machine users to jupyterhub swarmed user(in the container), A simple way is use GCE as a deployment directly


## Overall Picture

1. `create GCE instance with specified machine type and image by create_gce.sh or creaye_gce_gpu.sh` 
2. `login GCE by gcloud command`
3. `install jupyterhub, nbextension, jupyter-template in root python env`
4. `deploy jupyterhub_config.py & jupyter service`
5. `set up password for jupyterhub`
6. `(optional) make GCE ip stable and add ssh keys`
7. enjoy!

## GPU Setup

1. [manually add/remove GPU](https://cloud.google.com/compute/docs/gpus/add-remove-gpus#api)
2. [Driver Installtion](https://github.com/GoogleCloudPlatform/compute-gpu-installation)


## Detail Steps

1. create GCE instance with specified machine type and image
   - check machine-type (computational resource) and image (use ubuntu18.04) by `info/list_machine_resource.sh`, `info/list_image_list.sh`
   - `username@localhost:~/path/jupyter_workstation/gcloud$ bash create_gce.sh`
2. login GCE by gcloud command
   - `username@localhost:~/path/jupyter_workstation/gcloud$ bash login_gce.sh`
3. install jupyterhub, nbextension, jupyter-template in root python env
   - git clone or scp `jupyter_workstation` to remote
   - `username@localhost:~/path/jupyter_workstation/gcloud$ chomd 777 install_workstation.sh`
   - `username@Remote:~/$ sudo -s` (for better control)
   -  `root@Remote:path/jupyterworkstation/gcloud/$ bash install_workstation.sh`
   -  test installtion by some command in `test.sh`
4. deploy jupyterhub_config.py & jupyter service 
   - `root@Remote:path/jupyterworkstation/gcloud/$ bash deploy_config.sh` 
   - `root@Remote:path/jupyterworkstation/gcloud/$ bash deploy_service.sh`
   - test service by some command in `deploy_service.sh`
5. set up password for jupyterhub
   - `root@Remote:path/jupyterworkstation/gcloud/$ passwd jupyterhub`
   - or any user need to login. 

NOTE: develop in docker is still faster = )

[ref](https://medium.com/google-cloud/containerized-jupyter-notebooks-on-gpu-on-google-cloud-8e86ef7f31e9)

# Trouble Shooting
## ssh concern when GCE ip is shifting

```
                                                                                                                                                                                                    1,1           All
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ED25519 key sent by the remote host is
SHA256:ssvBTZD/2DnatzayV84vazcYALHfDaG54yX66zqecI4.
Please contact your system administrator.
Add correct host key in XXXXX to get rid of this message.
Offending ECDSA key in YYYYYY
Host key for ABC.DEF.GGG.YYY has changed and you have requested strict checking.
Host key verification failed.
lost connection
```

* ref : https://oit.colorado.edu/services/consulting-professional-services/systems-engineering/services/change-host-keys-used-ssh

## NodeJs version and pip version issue

* [install node 16 for ubuntu 18.04](https://github.com/nodesource/distributions#deb), or we cannot `npm install configurable-http-proxy`

clean nodejs on ubuntu

```
apt-get purge nodejs &&\
rm -r /etc/apt/sources.list.d/nodesource.list
```

* ubuntu 18.04 automantically use python3.6
* please update pip from 9.x to 21.x to avoid `rust` XXX