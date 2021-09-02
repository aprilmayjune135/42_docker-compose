#!bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
/usr/sbin/mysqld --user=root &

# Start the second process
./setup_mysql.sh


# bring the primary process back into the foreground
# and leave it there
fg %1

# reference see: https://docs.docker.com/config/containers/multi-service_container/
