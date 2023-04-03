# for ubuntu 18.04 only
# install base requirements
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

# configurable-http-proxy should be install when nodejs > 10, npm > 8
# accourding to node_sources_distribution : https://github.com/nodesource/distributions#deb
# we install nodejs 16x for ubuntu 18.04
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&\
apt-get install -y nodejs

npm install --global yarn

npm install -g configurable-http-proxy@^4.2.0 \
 && rm -rf ~/.npm

# upgrade pip into version 20+, to pip9 might be broken due to rust issue
python3 -m pip install --upgrade setuptools pip build wheel

# install gcc, vim
apt-get update \
 && apt-get install -yq \
    build-essential \
    vim

# install jupyterhub==1.5.1 (stable version compare to 2.3.1, 3.x)
# jupyter_contrib_nbextensions==0.5.1 (stable version compare to 0.7.0)
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

jupyter nbextension enable jupytemplate/main --system