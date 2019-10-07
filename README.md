# mysql-backup-to-aws-s3

##create backup user for mysql or percona

CREATE USER 'backupuser'@'localhost' IDENTIFIED BY 'pa$$w0rd';
GRANT SELECT, SHOW VIEW, LOCK TABLES, RELOAD, REPLICATION CLIENT ON *.* TO 'backupuser'@'localhost';
FLUSH PRIVILEGES;

##install awscli and configure keys for accessing aws s3
sudo apt install awscli
aws configure

##if used authentication on mysql
touch .my.cnf
chmod 600 .my.cnf
[client]
login="mysql_r00t"
password="mysql_pa$$"

