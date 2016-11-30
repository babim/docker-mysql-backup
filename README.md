[![](https://images.microbadger.com/badges/image/babim/mysql-backup.svg)](https://microbadger.com/images/babim/mysql-backup "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/mysql-backup.svg)](https://microbadger.com/images/babim/mysql-backup "Get your own version badge on microbadger.com")

# Dockerfile for backup MariaDB/Mysql database
Thanks jerob

example:
```
docker pull babim/mysql-backup
```
with root backup all data:
```
docker run -it --name mysql-backup -v /mysqlbackup:/backup -e HOST=192.168.1.10 -e PROTO=3306 -e ADMIN=root babim/mysql-backup
```
with user backup user's all data:
```
docker run -it --name mysql-backup -v /mysqlbackup:/backup -e HOST=192.168.1.10 -e PROTO=3306 -e MUSER=demo babim/mysql-backup
```
with user backup each data:
```
docker run -it --name mysql-backup -v /mysqlbackup:/backup -e HOST=192.168.1.10 -e PROTO=3306 -e MUSER=demo -e DBS=wordpress babim/mysql-backup
```
