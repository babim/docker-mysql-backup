# Dockerfile for backup MariaDB/Mysql database
Thanks jerob

example:
```
docker pull babim/mysql-backup

docker run -it --name mysql-backup -v /mysqlbackup:/backup -e HOST=192.168.1.10 -e PROTO=3306 -e ADMIN=root babim/mysql-backup
```
