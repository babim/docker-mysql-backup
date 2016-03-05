#!/bin/bash
BACKUP=/backup
NOW="$(date +"%d-%m-%Y_%H%M")"
OLD="$(date +"%d-%m-%Y" -d '-7 day')"
# create directory
mkdir -p "$BACKUP/sql/$NOW/"
# all databases
mysqldump -u root --host=$HOST --protocol=$PROTO --password=$PASS --all-databases --single-transaction > "$BACKUP/sql/$NOW/all_databases.sql"
# backup each base of the database
DBS="$(mysql -u $MUSER --host=$HOST --protocol=$PROTO -p$PASS -Bse 'show databases')"
for db in $DBS
do
	mysqldump -u root --host=$HOST --protocol=$PROTO --password=$PASS $db --single-transaction > "$BACKUP/sql/$NOW/$db.sql"
done
# delete old sql
rm -r $BACKUP/sql/$OLD*
