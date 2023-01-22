# change to user root
# sudo -s
# cd /home
# chmod 777 username/install_workstation.sh
# bash username/install_workstation.sh

# install jupyterhub
# code borrow from jupyterhub dockerfile
# https://github.com/jupyterhub/jupyterhub/blob/main/Dockerfile
apt-get update \
 && apt-get install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    locales \
    python3-dev \
    python3-pip \
    python3-pycurl \
    python3-venv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# ubuntu 18.04 with nodejs 16.x
# nodejs should be 16.x
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
apt-get install -y nodejs

npm install --global yarn

npm install -g configurable-http-proxy@^4.2.0 \
 && rm -rf ~/.npm

# install python, pip in root
python3 -m pip install --upgrade setuptools pip build wheel

# install python3.8, gcc, vim
apt-get update \
 && apt-get install -yq \
    build-essential \
    vim

pip install jupyterhub==1.5.1 \
    notebook --upgrade \
    jupyter_contrib_nbextensions==0.5.1 \
    jupytemplate


useradd -m jupyterhub

mkdir jupyterhub

chown jupyterhub:jupyterhub jupyterhub -R

# install nbextension @ system level and perform symbol-link
jupyter contrib nbextension install --system --symlink --debug

chmod -R 0777 /usr/local/etc/jupyter/nbconfig

jupyter nbextensions_configurator enable --system

# install jupyter template
jupyter nbextension install --py jupytemplate --system --symlink --debug

jupyter nbextension enable jupytemplate --py

# build folders jupyterhub
mkdir -p /srv/jupyterhub/