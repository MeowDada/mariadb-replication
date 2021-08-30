#!/bin/bash
CONTAINER_NAME=mariadb-primary

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/conf/my.cnf:/etc/mysql/my.cnf \
-v $PWD/scripts/create-replication-user.sql:/docker-entrypoint-initdb.d/create-replication-user.sql \
-v $PWD/scripts/create-monitor-user.sql:/docker-entrypoint-initdb.d/create-monitor-user.sql \
-v $PWD/scripts/create-maxscale-user.sql:/docker-entrypoint-initdb.d/create-maxscale-user.sql \
-p 4001:3306 \
-e MARIADB_ROOT_USER=root \
-e MARIADB_ROOT_PASSWORD=password \
mariadb:10.6
