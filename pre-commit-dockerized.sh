#!/usr/bin/env bash

REPO_PATH=~/workspace/docker-pre-commit
IMAGE_NAME=local/pre-comit

function pre_commit() {
  docker run --rm -it -v "pre-commit-cache_${PWD##*/}:/root/.cache/pre-commit" -v "${PWD}:/workspace" local/pre-commit:latest pre-commit "${@}"
}

if grep -q "${IMAGE_NAME}" < <(docker image ls --format reference=${IMAGE_NAME}); then
  pre_commit "${@}"
else
  docker compose -f "${REPO_PATH}/.docker/docker-compose.build.yml" build
  pre_commit "${@}"
fi
