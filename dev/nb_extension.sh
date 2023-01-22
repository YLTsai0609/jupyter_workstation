# ref(official) : https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html
# ref : https://gist.github.com/prerakmody/fd860cb6bf37d34ee912a94e4967618d

# install use root user for provide system-wise extension support
pip install jupyter_contrib_nbextensions

# by default, will use --user (only for single user)
# --system - to install into system-wide jupyter directories
# --symlink - to symlink the nbextesnions rathan than copying each file (recommended on non-linux platform)
jupyter contrib nbextension install --system --symlink --debug


jupyter nbextensions_configurator enable --system

chmod -R 0777 /usr/local/etc/jupyter/nbconfig

# ref : jupyter-template
# https://github.com/xtreamsrl/jupytemplate

pip install jupytemplate

jupyter nbextension install --py jupytemplate --system --symlink --debug

jupyter nbextension enable jupytemplate --py