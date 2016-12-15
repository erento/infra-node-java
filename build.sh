#!/bin/bash

set -e

DOCKER_REPO=${DOCKER_REPO:-'erento'}
DOCKER_NAME='node-java'
DOCKER_TAG=${DOCKER_TAG:-'latest'}
DOCKER_IMAGE="$DOCKER_REPO/$DOCKER_NAME:$DOCKER_TAG"

## Dependencies.
DOCKER=$(command -v docker) || { echo "$SCRIPTNAME: docker is not available!"; exit 1; }
DOCKER=${DOCKER_CMD:-$DOCKER}

${DOCKER} build -t ${DOCKER_IMAGE} .

echo "Built ${DOCKER_IMAGE}"
