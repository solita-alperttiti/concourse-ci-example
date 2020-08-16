#!/bin/sh

set -e

DOCKER_FILE=$1
DOCKER_TAG=$2
OUTPUT_DIR=$3


mkdir -p $OUTPUT_DIR/ && cp concourse-example/example-docker/Dockerfile $OUTPUT_DIR/$DOCKER_FILE
echo "RUN echo 'This is tagged with ${DOCKER_TAG}'" >> $OUTPUT_DIR/$DOCKER_FILE

