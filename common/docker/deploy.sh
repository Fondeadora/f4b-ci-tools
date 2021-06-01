#!/bin/bash

# Script to deploy application to a certain cluster an stage configuration
#
# @param $1 app_name - Application name by environment
# @param $2 tag_name - Latest commit tag uploaded to the ECR image

STACK_FILE=$1
TAG_NAME=$2
APP_NAME=$3
APP_PORT=$4
AWS_ACCOUNT=$5
CLUSTER=$6
AWS_KEY=$7
AWS_SECRET=$8
AWS_REGION=$9

export AWS_ACCESS_KEY_ID=$AWS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET
export AWS_DEFAULT_REGION=$AWS_REGION

REPOSITORY="$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com"

aws cloudformation update-stack --stack-name $APP_NAME \
  --template-body file:///$STACK_FILE --parameters \
  ParameterKey=DockerImage,ParameterValue=$REPOSITORY/$APP_NAME:$TAG_NAME \
  ParameterKey=ClusterName,ParameterValue=$CLUSTER \
  ParameterKey=AppName,ParameterValue=$APP_NAME \
  ParameterKey=ContainerPort,ParameterValue=$APP_PORT

aws cloudformation wait stack-update-complete --stack-name $APP_NAME
