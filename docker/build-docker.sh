#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-parkingcrypto/parkingd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/parkingd docker/bin/
cp $BUILD_DIR/src/parking-cli docker/bin/
cp $BUILD_DIR/src/parking-tx docker/bin/
strip docker/bin/parkingd
strip docker/bin/parking-cli
strip docker/bin/parking-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
