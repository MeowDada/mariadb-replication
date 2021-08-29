#!/bin/bash
CONTAINER_NAME=maxscale

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/conf/maxscale.cnf:/etc/maxscale.cnf.d/my-maxscale.cnf \
-p 8989:8989 \
-p 4006:4006 \
-p 4008:4008 \
mariadb/maxscale: 2.5.13
