#!bin/bash

# set permisison
chown -R mysql:mysql /var/lib/mysql
chmod 755 /var/lib/mysql

# turn on bash's job control
set -m

# start the primary process and put it in the background
/usr/sbin/mysqld --user=mysql &

# start the second process
./setup_mysql.sh

# bring the primary process back into the foreground and leave it there
# reference see: https://docs.docker.com/config/containers/multi-service_container/
fg %1
