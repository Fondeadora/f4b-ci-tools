#!/bin/bash

docker build -t $APP_NAME:latest \
  --build-arg stage=$STAGE \
  --build-arg port=$APP_PORT \
  --build-arg aws_key=$AWS_ACCESS_KEY_ID \
  --build-arg aws_secret=$AWS_SECRET_ACCESS_KEY \
  --build-arg aws_region=$AWS_DEFAULT_REGION \
  .