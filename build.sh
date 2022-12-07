#!/usr/bin/env bash

TAG=latest
LOCAL_IMAGE_NAME=dockertest

docker build -t "$LOCAL_IMAGE_NAME:$TAG" -f Dockerfile .

