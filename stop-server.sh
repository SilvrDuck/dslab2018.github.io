#!/usr/bin/env bash

CURRENT_DIR=$(readlink -qe $(dirname "${BASH_SOURCE[0]}"))

if hash docker-compose 2>/dev/null; then
  docker-compose down
else
  docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $CURRENT_DIR:$CURRENT_DIR -w $CURRENT_DIR docker/compose:1.19.0 down
fi
