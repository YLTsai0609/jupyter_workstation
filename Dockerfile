FROM jupyterhub/jupyterhub:1.5.1

# add user jupyterhub, without setting password
RUN useradd -m jupyterhub

# install gcc, vim 
# when we need a smaller image, we may specify gcc,python3.8, pip 21 should be better
RUN apt-get update \
 && apt-get install -yq \
    build-essential \
    vim

# jupyter_contrib_nbextensions : lastest version 0.7.1 is buggy (table of content not shown)
RUN pip install notebook --upgrade \
    jupyter_contrib_nbextensions==0.5.1 \
    jupytemplate

RUN chmod -R 777 /home/
RUN cd /home/
RUN mkdir jupyterhub
RUN chown jupyterhub:jupyterhub jupyterhub -R

# install nbextension @ system level and perform symbol-link
RUN jupyter contrib nbextension install --system --symlink --debug
RUN chmod -R 0777 /usr/local/etc/jupyter/nbconfig
RUN jupyter nbextensions_configurator enable --system

# install jupyter template
RUN jupyter nbextension install --py jupytemplate --system --symlink --debug
RUN jupyter nbextension enable jupytemplate --py

COPY jupyterhub_config.py /etc/jupyterhub

WORKDIR /srv/jupyterhub/

EXPOSE 8000

CMD ["jupyterhub"]