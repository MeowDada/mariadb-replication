# Mariadb Replication
In this simple project, we are going to demo how to setup a mariadb replication set consist of 2 MariaDB instance (1 as primary, another as replica) and a MaxScale.

If everything are going well, you are able to check the replication status at `http://localhost:8989/` with `admin/mariadb` as login account.

# Requirements
* Linux environment
* Docker installed
* Little knowlege about mariadb
* No occupied ports as below:
  * 8989
  * 4001
  * 4002
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

## Start Replication
Inorder to start replication, you have to make sure that there will be no more write operations
to the primray node. Or you might want to prevent it by using below command.

```sql
FLUSH TABLES WITH READ LOCK
```
Keep this session running - existing it will release the lock.

Then, we can use `mysqldump` command to dump the data in current primray node.
```bash
# uses primary folder as root
./dump-mariadb-primary.sh
```

It will generate a file named `dump.sql`. And we need to put this file to `replica` folder,
then load the replica with following command:

```bash
# uses replica folder as root
./load-mariadb-dump.sh
```

Finally, we are going to login mariadb console by

```bash
# uses replica folder as root
./login-mariadb-replica.sh
```

Enter the password to obtain the mariadb console and we need to
use following commands to start replication

```sql
CHANGE MASTER TO
MASTER_HOST='172.17.0.1',
MASTER_PORT=4001,
MASTER_USER='repl_user',
MASTER_PASSWORD='repl_password';

START SLAVE;

# optional
SHOW SLAVE STATUS\G;
```

## Setup MaxScale
At final, we are going to setup our maxscale as MariaDB Proxy server.

```bash
# uses maxscale folder as root
./start-maxscale
```

## Done
Hooray!! We can now visit `http://localhost:8989/` with account `admin/mariadb` to check our deployment.

If you're doing it correctly, it should be able to apply `auto failover` when the master node is down.