CREATE USER IF NOT EXISTS 'repl_user'@'%' IDENTIFIED BY 'repl_password';
GRANT RELOAD, SUPER, REPLICATION SLAVE, REPLICATION CLIENT, SLAVE MONITOR ON *.* To 'repl_user'@'%' IDENTIFIED BY 'repl_password';
FLUSH PRIVILEGES;
