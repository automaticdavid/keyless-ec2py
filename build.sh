#!/bin/bash -e
# build a docker image for this service

export SERVICE="keyless-ec2"
export SERVICE_NAME="keyless-ec2"
export SERVICE_REPO="keyless-ec2"
export SERVICE_VERSION=1.0

# build the image
docker build --build-arg SERVICE_NAME=$SERVICE_NAME \
	     --build-arg SERVICE_VERSION=$SERVICE_VERSION \
             -t $SERVICE_REPO/$SERVICE_$SERVICE_NAME .

