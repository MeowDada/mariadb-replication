CREATE USER IF NOT EXISTS 'maxscalemon'@'%' IDENTIFIED BY 'maxscalemon_pw';
GRANT REPLICATION SLAVE ADMIN, FILE ON *.* TO 'maxscalemon'@'%';
FLUSH PRIVILEGES;