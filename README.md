# Mariadb Replication
In this simple project, we are going to demo how to setup a mariadb replication set consist of 3 MariaDB instance (1 as primary, others as replica) and a MaxScale.

If everything are going well, you are able to check the replication status at `http://localhost:8989/` with `admin/mariadb` as login account.

# Requirements
* Linux environment
* Docker installed
* Little knowlege about mariadb
* No occupied ports as below:
  * 8989
  * 4001
  * 4002
  * 4003
  * 4006
  * 4008

# Setup
## Setup primary instance
At the begining, we have to setup our primary mariadb instance by

```bash
# uses primary folder as root
./start-mariadb-primary.sh
```

## Setup replica instances
Then, we are going to launch another two replica instances

```bash
# uses replica folder as root
./start-mariadb-replica.sh
```

## Using GTID replication
Because our based image will only apply old-style replication method which prevents us from using MaxScale features like `auto failover`, `swith over` and `auto rejoin`. We have to do additional works to make it adopt to GTID replication method.

Login to each replica instance (depends on how many replica instance you have) and do something as below:

```bash
# login to the replica instance
mysql -h ${hostname} -P ${port} -u root -p
```

For example:
```bash
mysql -h 127.0.0.1 -P 4002 -u root -p
```

Enter the password to obtain mariadb console. Then we have to use following command to apply GTID replication.

```sql
# stop replication
STOP SLAVE;

# to apply gtid replication
CHANGE MASTER TO MASTER_USE_GTID=slave_pos;

# start replication again
START SLAVE;

# check replication status (optional)
SHOW REPLICA STATUS \G;
```

> Remember, you have to apply CHANGE MASTER command for each replica instance.

## Setup MaxScale
At final, we are going to setup our maxscale as MariaDB Proxy server.

```bash
# uses maxscale folder as root
./start-maxscale
```

## Done
Hooray!! We can now visit `http://localhost:8989/` with account `admin/mariadb` to check our deployment.

If you're doing it correctly, it should be able to apply `auto failover` when the master node is down.