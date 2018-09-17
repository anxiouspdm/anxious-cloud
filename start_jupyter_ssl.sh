#!/usr/bin/env bash

NAME=jupyterhub

# Set up your DOMAIN
if [ $# -eq 0 ]; then
    echo "Please inform your domain name to run your jupyterhub."
    echo "./start_jupyter_ssl.sh $1"
    exit 1
else
    DOMAIN=$1
fi

# Read your .env file
source .env

# Build image
docker build ./jupyter -t easy-cloud/jupyterhub

# Testing your proxy
if [ -z ${SERVICE_NETWORK+X} ]; then
    docker run -d -v /opt/jupyter:/homer:rw -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN --network=$NETWORK --name $NAME --restart=always easy-cloud/jupyterhub
else
    docker run -d -e VIRTUAL_HOST=$DOMAIN -e LETSENCRYPT_HOST=$DOMAIN --network=$SERVICE_NETWORK --name $NAME --restart=always easy-cloud/jupyterhub
fi

echo "Change password for jupyter user"
docker exec -it jupyterhub passwd jupyter

exit 0
