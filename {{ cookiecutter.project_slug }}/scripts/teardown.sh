#!/usr/bin/env bash

docker ps -a | awk '$2 ~ /{{ cookiecutter.project_binary }}/ {print $1}' | xargs -I {} docker rm -f {}
docker network rm {{ cookiecutter.project_repo }}_network
