#!bin/bash

# set permisison
chmod -R 755 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/mysqld
chmod -R 755 /run/mysqld
chown -R mysql:mysql /run/mysqld

# initiating data files for mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
fi

# turn on bash's job control
set -m

# start the primary process and put it in the background
/usr/sbin/mysqld --user=mysql &

# start the second process
./setup_mysql.sh

# bring the primary process back into the foreground and leave it there
# reference see: https://docs.docker.com/config/containers/multi-service_container/
fg %1
