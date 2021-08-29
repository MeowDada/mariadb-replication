#!/bin/bash
CONTAINER_NAME=mariadb-replica

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/conf/my.cnf:/etc/mysql/my.cnf \
-p 4002:3306 \
-e MARIADB_ROOT_USER=root \
-e MARIADB_ROOT_PASSWORD=password \
mariadb:10.5
