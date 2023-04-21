#!/bin/bash
set -e

IMAGE_NAME="pjsip-release/ios"
CONTAINER_NAME="pjsip-release-${RANDOM}"

rm -rf ./dist/ios;
mkdir -p ./dist/;

docker build -t pjsip-release/ios ./ios/;
docker run --name ${CONTAINER_NAME} ${IMAGE_NAME} bin/true

docker cp ${CONTAINER_NAME}:/dist/ios ./dist/ios

docker rm ${CONTAINER_NAME}
