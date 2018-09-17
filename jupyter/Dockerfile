FROM continuumio/anaconda3

RUN conda install -c conda-forge jupyterhub
RUN conda install jupyterlab

RUN jupyter labextension install @jupyterlab/hub-extension

RUN useradd -m user -p password

EXPOSE 80
CMD jupyterhub --port 80 --Spawner.cmd="jupyter-labhub"
