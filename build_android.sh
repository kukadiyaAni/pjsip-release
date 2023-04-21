#!/bin/bash
set -e

IMAGE_NAME="pjsip-release/android"
CONTAINER_NAME="pjsip-release-${RANDOM}"

rm -rf ./dist/android;
mkdir -p ./dist/;

docker build -t pjsip-release/android ./android/;
docker run --name ${CONTAINER_NAME} ${IMAGE_NAME} bin/true

docker cp ${CONTAINER_NAME}:/dist/android ./dist/android

docker rm ${CONTAINER_NAME}
