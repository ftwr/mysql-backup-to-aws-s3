# mysql-backup-to-aws-s3 (without locking tables, and delete old backups in s3 via shell)

## create backup user for mysql or percona
```shell
CREATE USER 'backupuser'@'localhost' IDENTIFIED BY 'pa$$w0rd';
GRANT SELECT, SHOW VIEW, LOCK TABLES, RELOAD, REPLICATION CLIENT ON *.* TO 'backupuser'@'localhost';
FLUSH PRIVILEGES;
```
## install awscli and configure keys for accessing aws s3
```shell
sudo apt install awscli
aws configure
```
## if used authentication on mysql
```shell
touch .my.cnf
chmod 600 .my.cnf
```
## insert this in .my.cnf
```shell
[client]
login="mysql_r00t"
password="mysql_pa$$"
```

## crontab -e
```shell
0 0 * * * /root/myscript >> /root/myscript.log 2>&1
```
