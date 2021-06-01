#!/bin/bash

# Push new image tag to ECR
#
# @param $1 tag_name - Tag Name that will be pushed

TAG_NAME=$1

aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $REGISTRY

docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:latest
docker push $REGISTRY/$APP_NAME:latest

docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:$TAG_NAME
docker push $REGISTRY/$APP_NAME:$TAG_NAME