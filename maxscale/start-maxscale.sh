#!/bin/bash
CONTAINER_NAME=maxscale

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/conf/maxscale.cnf:/etc/maxscale.cnf \
--network host \
mariadb/maxscale:2.5.13
