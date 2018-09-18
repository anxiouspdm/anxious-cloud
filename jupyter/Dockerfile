FROM continuumio/anaconda3

RUN conda install -c conda-forge jupyterhub
RUN conda install jupyterlab

RUN conda install nb_conda_kernels
RUN jupyter labextension install @jupyterlab/hub-extension

RUN useradd -m jupyter

USER jupyter
RUN conda create -n jupyter_user_env
RUN conda install -n jupyter_user_env ipykernel
RUN source activate jupyter_user_env
RUN ipython kernel install --user --name jupyter_user_env

USER root

EXPOSE 80
CMD jupyterhub --port 80 --Spawner.cmd="jupyter-labhub"
