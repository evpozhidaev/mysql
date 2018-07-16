#!/bin/sh

sqldump_path=`which mysqldump`
sql_path=`which mysqladmin`
db_user="USER"
db_pass="PASSWORD"
backups_dir="/SHARED/MySQL"
current_date=`date +%y_%m_%d`

$sql_path -u$db_user -p$db_pass stop-slave

echo "Database type mysql. Dumping database... please wait."

$sqldump_path -u$db_user -p$db_pass UTM5 > $backups_dir/UTM5.${current_date}.sql

$sql_path -u$db_user -p$db_pass start-slave
