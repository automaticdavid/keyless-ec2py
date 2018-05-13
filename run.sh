#!/bin/bash -e
# This needs AWS access defined environement variables:
# $AWS_SECRET_ACCESS_KEY
# $AWS_ACCESS_KEY_ID
# Use sudo -E if running with sudo
# Consider using a secrets instead
# Modify $NETWORK to match your containers' network

export SERVICE="keyless-ec2"
export SERVICE_NAME="keyless-ec2"
export SERVICE_REPO="keyless-ec2"
export SERVICE_VERSION=1.0
export NETWORK="dclnet"

sudo docker rm -f $SERVICE_NAME 
sudo docker run -d --name $SERVICE_NAME \
		--network=$NETWORK \
		--network-alias=$SERVICE_NAME \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                $SERVICE_REPO/$SERVICE_NAME 
