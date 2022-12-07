#!/usr/bin/env bash

TAG=latest
LOCAL_IMAGE_NAME=dockertest

docker tag "$LOCAL_IMAGE_NAME:$TAG" "docker.io/dulanj/simaple-application"
docker push "docker.io/dulanj/simaple-application"