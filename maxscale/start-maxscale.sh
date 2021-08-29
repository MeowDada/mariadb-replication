#!/bin/bash
CONTAINER_NAME=maxscale

docker run \
-d --rm --name $CONTAINER_NAME \
--network host \
mymaxscale
