FROM continuumio/anaconda3

RUN conda install -c conda-forge jupyterhub
RUN conda install jupyterlab

RUN conda install nodejs
RUN jupyter labextension install @jupyterlab/hub-extension

EXPOSE 80
CMD jupyterhub --port 80 --Spawner.cmd="jupyter-labhub"
