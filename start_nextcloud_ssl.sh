#!/usr/bin/env bash

cd nextcloud

# Read your .env file
source .env

# Compose app
docker-compose up -d
