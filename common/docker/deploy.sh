#!/bin/bash

# Script to deploy application to a certain cluster an stage configuration
#
# @param $1 app_name - Application name by environment
# @param $2 tag_name - Latest commit tag uploaded to the ECR image

STACK_FILE=$1
TAG_NAME=$2

aws cloudformation update-stack --stack-name $APP_NAME \
  --template-body file:///$STACK_FILE --parameters \
  ParameterKey=DockerImage,ParameterValue=$REPOSITORY/$APP_NAME:$TAG_NAME \
  ParameterKey=ClusterName,ParameterValue=$CLUSTER \
  ParameterKey=AppName,ParameterValue=$APP_NAME \
  ParameterKey=ContainerPort,ParameterValue=$APP_PORT