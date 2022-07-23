#!/bin/bash
set -eu

# Build client
MAIN_CONTAINER="sidecar-grpc-client"

echo "Building client image..."
docker build -t $MAIN_CONTAINER grpc-client/.

echo "Publishing client image in minikube"
minikube image load $MAIN_CONTAINER

# Build server
SIDECAR="sidecar-grpc-server"

echo "Building server image..."
docker build -t $SIDECAR grpc-server/.

echo "Publishing server image in minikube"
minikube image load SIDECAR