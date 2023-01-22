# Ref

https://blog.csdn.net/weixin_48114253/article/details/117548513

WalkThrough

[x] - 拉取 jupyterhub ， 連接 volumn ， 跑起來

[x] - 建立 user - jupyterhub

[x] - 安裝 gcc , vim & 安裝 notebook

[x] - 配置 home 權限，驗證本機端的 notebook

[x] - 設置 jupyterhub 為 admin(super user)

[x] - 產生 jupyterhub_config.py，搬出來

[x] - local machine user, docker swam user - mismatch

[x] - nbextension

[x] - jupyter-template
# NOTE

1.0.0 有點問題，Set LocalAuthenticator.create_system_users=True

2.3.1 /3.1 / 3 會一直 restart (不穩定，很爛)

Use version : 1.5.1


# User Management

## add user
* by jupyterhub GUI (without password)
* root `useradd` username (X) - wrong folder path
* root `passwd` userpassword

### user auth about its folder


## delete user
   * root userdel uname 
   * root userdel -r uname (folders & buffers)