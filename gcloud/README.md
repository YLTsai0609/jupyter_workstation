# gcloud

To simplify user management - without mapping host-machine users to jupyterhub swarmed user(in the container), A simple way is use GCE as a deployment directly

steps:

0. pick your machine-type (computational resource) and image (use ubuntu18.04)
1. `bash create_gce.sh` (make sure your gcloud works fine with your project)
2. `bash login_gce.sh` (put your ssh keys)
3. `scp or git clone` repo
4. `sudo -s && cd /home/`
5. `sudo bash install_workstation_cpu.sh`
6. (optional) - check dependency works fine(`test.sh`)
7. deploy config - check `deploy_config.sh`
8. `bash deploy.service.sh`

NOTE: develop in docker is still faster = )

ref : https://medium.com/google-cloud/containerized-jupyter-notebooks-on-gpu-on-google-cloud-8e86ef7f31e9

# Trouble Shooting

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

clean nodejs on ubuntu

```
apt-get purge nodejs &&\
rm -r /etc/apt/sources.list.d/nodesource.list
```