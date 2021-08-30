#!/bin/bash
CONTAINER_NAME=mariadb-replica

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/scripts/create-replication-user.sql:/docker-entrypoint-initdb.d/create-replication-user.sql \
-v $PWD/scripts/create-maxscale-user.sql:/docker-entrypoint-initdb.d/create-maxscale-user.sql \
-v $PWD/conf/my.cnf:/etc/mysql/my.cnf \
-p 4002:3306 \
-e MARIADB_ROOT_USER=root \
-e MARIADB_ROOT_PASSWORD=password \
mariadb:10.6
