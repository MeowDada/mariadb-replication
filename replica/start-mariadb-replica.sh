#!/bin/bash
CONTAINER_NAME=mariadb-replica

docker run \
-d --rm --name $CONTAINER_NAME \
-v $PWD/conf/my.cnf:/opt/bitnami/mariadb/conf/my_custom.cnf:ro \
-e MARIADB_REPLICATION_MODE=slave \
-e MARIADB_REPLICATION_USER=repl_user \
-e MARIADB_REPLICATION_PASSWORD=repl_password \
-e MARIADB_MASTER_HOST=172.17.0.1 \
-e MARIADB_MASTER_PORT_NUMBER=4001 \
-e MARAIDB_MASTER_ROOT_USER=root \
-e MARIADB_MASTER_ROOT_PASSWORD=password \
-p 4002:3306 \
bitnami/mariadb:10.5
