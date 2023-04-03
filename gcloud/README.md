# gcloud

To simplify user management - without mapping host-machine users to jupyterhub swarmed user(in the container), A simple way is use GCE as a deployment directly


## Overall Picture

1. `create GCE instance with specified machine type and image by` 
   1. `create_gce.sh`
   2. `create_gce_gpu.sh` - with nvidia driver only (without nvidia cuda toolkit and cuda runtime)
   3. `create_gce_gpu_torch.sh` - with nvidia driver, nvcc and pytorch
2. `login GCE by gcloud command`

(if development env)

3. `sudo --login`, `install jupyterhub, nbextension, jupyter-template in root python env` 
4. `deploy jupyterhub_config.py & jupyter service`
5. `set up password for jupyterhub`
6. `(optional) make GCE ip stable and add ssh keys`
7. enjoy!

## TODO

docker version of dev and deployment

## Detail Steps

1. create GCE instance with specified machine type and image
   - check machine-type (computational resource) and image (use ubuntu18.04) by `info/list_machine_resource.sh`, `info/list_image_list.sh`
   - `username@localhost:~/path/jupyter_workstation/gcloud$ bash create_gce.sh`
2. login GCE by gcloud command
   - `username@localhost:~/path/jupyter_workstation/gcloud$ bash login_gce.sh`
3. install jupyterhub, nbextension, jupyter-template in root python env
   - git clone or scp `jupyter_workstation` to remote `opt/workstation`
   - `username@localhost:~/path/jupyter_workstation/gcloud$ chomd 777 install_workstation.sh`
   - `username@Remote:~/$ sudo --login` (for better control)
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

## GPU Setup

1. [manually add/remove GPU](https://cloud.google.com/compute/docs/gpus/add-remove-gpus#api)
2. [Driver & CUDA ToolKit Installtion](https://github.com/GoogleCloudPlatform/compute-gpu-installation)


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

## GPU trouble shooting

1. [stop machine / start machine, detached GPU, `nvidia-smi` could not found gpu](https://stackoverflow.com/questions/71596911/can-not-find-nvidia-driver-after-stop-and-start-a-deep-learning-vm?fbclid=IwAR3oHl_svU9jXjU7H1OyS6q2L1v--6JsQhpO539PUSoOwTXkzDkBKBd1xV4)
   - compelete remove cuda and start over.
   - `sudo apt remove --purge '*nvidia*'`
   - `sudo python3 /opt/google/install_gpu_driver.py` (systemwise python)

2. [Use GPU in CircleCI](https://circleci.com/docs/using-gpu/?fbclid=IwAR0N5qHWGwqpdGg2wR6irVolhA8LbxMVkcvkfy18Gq_hFoQeRX4hqEsrPIE)
