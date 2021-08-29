#!/bin/bash
CONTAINER_NAME=mariadb-primary

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/conf/my.cnf:/opt/bitnami/mariadb/conf/my_custom.cnf:ro \
-v $PWD/scripts/create-monitor-user.sql:/docker-entrypoint-initdb.d/create-monitor-user.sql \
-v $PWD/scripts/create-maxscale-user.sql:/docker-entrypoint-initdb.d/create-maxscale-user.sql \
-p 4001:3306 \
-e MARIADB_ROOT_USER=root \
-e MARIADB_ROOT_PASSWORD=password \
-e MARIADB_REPLICATION_MODE=master \
-e MARIADB_REPLICATION_USER=repl_user \
-e MARIADB_REPLICATION_PASSWORD=repl_password \
bitnami/mariadb:10.5
