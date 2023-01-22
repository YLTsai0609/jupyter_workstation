# Jupyter WorkStation

Jupyterhub + nbextension + templates + GPU driver support (if necessary)

* [x] - 拉取 jupyterhub ， 連接 volumn ， 跑起來

* [x] - 建立 user - jupyterhub

* [x] - 安裝 gcc , vim & 安裝 notebook

* [x] - 配置 home 權限，驗證本機端的 notebook

* [x] - 設置 jupyterhub 為 admin(super user)

* [x] - 產生 jupyterhub_config.py，搬出來

* [x] - local machine user, docker swam user - mismatch

* [x] - nbextension

* [x] - jupyter-template


# User Management

## add user
* by jupyterhub GUI (without password)
* root `useradd` username (X) - wrong folder path
* root `passwd` userpassword

### user auth about its folder


## delete user
   * root userdel uname 
   * root userdel -r uname (folders & buffers)

ref : https://blog.csdn.net/weixin_48114253/article/details/117548513
