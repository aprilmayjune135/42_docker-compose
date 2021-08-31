#!bin/bash
#/etc/init.d/mysql  stop
#/etc/init.d/mysql  start

cd /var/lib/mysql
ls
rm -r *
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
