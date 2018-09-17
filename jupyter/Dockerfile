FROM continuumio:anaconda3

CMD conda install -c conda-forge jupyterhub
CMD conda install jupyterlab

CMD conda install nodejs
CMD jupyter labextension install @jupyterlab/hub-extension

EXPOSE 80
CMD jupyterhub --port 80 --Spawner.cmd="jupyter-labhub"
