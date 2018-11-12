#!/bin/bash
# Monitoring status MySQL Replication and Seconds_behind_master

usermy=mysqluser
passmy=mysqlpasswd
 
if [ $# -eq 1 ]; then
        if [ $1 == Slave_IO_Running ]; then
                slave_status=$(mysql -u${usermy} -p${passmy} -e'show slave status\G' | awk '$1=="Slave_IO_Running:" {print $2}')
 
                if [ $slave_status == Yes ]; then
                        slave_status=1
                else
                        slave_status=0
                fi
 
        elif [ $1 == Slave_SQL_Running ]; then
                slave_status=$(mysql -u${usermy} -p${passmy} -e'show slave status\G' | awk '$1=="Slave_SQL_Running:" {print $2}')
 
                if [ $slave_status == Yes ]; then
                        slave_status=1
                else
                        slave_status=0
                fi
 
        elif [ $1 == Seconds_Behind_Master ]; then
                slave_status=$(mysql -u${usermy} -p${passmy} -e'show slave status\G' | awk '$1=="Seconds_Behind_Master:" {print $2}')
        fi
 
echo $slave_status
fi
