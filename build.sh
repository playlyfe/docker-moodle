#!/usr/bin/env bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOCKER_IMAGE="playlyfe/moodle:latest"
docker build --tag="$DOCKER_IMAGE" .
