#!/bin/bash

TAG_NAME=$1
APP_NAME=$2
REGISTRY=$3
AWS_KEY=$4
AWS_SECRET=$5
AWS_REGION=$6

export AWS_ACCESS_KEY_ID=$AWS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET
export AWS_DEFAULT_REGION=$AWS_REGION

ECR_TOKEN=$(aws ecr get-login-password)

echo $ECR_TOKEN
echo $REGISTRY

docker login -u AWS -p "$ECR_TOKEN" $REGISTRY

docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:latest
docker push $REGISTRY/$APP_NAME:latest

docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:$TAG_NAME
docker push $REGISTRY/$APP_NAME:$TAG_NAME
