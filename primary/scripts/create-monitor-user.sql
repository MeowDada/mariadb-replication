CREATE USER IF NOT EXISTS 'maxscalemon'@'%' IDENTIFIED BY 'maxscalemon_pw';
GRANT REPLICATION CLIENT ON *.* TO 'maxscalemon'@'%';
GRANT SUPER, RELOAD ON *.* TO 'maxscalemon'@'%';
FLUSH PRIVILEGES;