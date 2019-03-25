#!/bin/bash


mkdir work
docker run -d -p 8000:8000 --name jupyterhub --volume $(pwd)/work:/shares jupyterhub

docker exec jupyterhub /docker_configuration.sh
