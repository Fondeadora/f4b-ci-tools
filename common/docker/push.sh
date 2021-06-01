#!/bin/bash

# Push new image tag to ECR
#
# @param $1 ecr_token - AWS ECR Access token
# @param $2 tag_name - Tag Name that will be pushed

ECR_TOKEN=$1
TAG_NAME=$2

docker login --username AWS -p "$ECR_TOKEN" $REGISTRY

docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:latest
docker push $REGISTRY/$APP_NAME:latest

docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:$TAG_NAME
docker push $REGISTRY/$APP_NAME:$TAG_NAME