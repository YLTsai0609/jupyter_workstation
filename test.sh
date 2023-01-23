# some essential test if we meets some trouble

# get into docker
sh hub_shell.sh

# gcc 
# container-root
gcc --version

# container-root
# pip, should be /usr/local/bin/pip
which pip

# container-root
# pip, should be pip 22.3.1 from /usr/local/lib/python3.8/dist-packages/pip (python 3.8) (to avoid rust not installed)
pip -V

# container-root
# nbextension, should be successfully installed
ls /usr/local/etc/jupyter/nbconfig

# container-root
# jupyterhub, should execute successfully (without error msg)

jupyterhub --help

# container-root configurable-http-proxy
configurable-http-proxy --help