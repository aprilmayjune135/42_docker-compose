#!bin/bash

# service has to be started in order to process the setup
service mysql start

# create the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DATABASE};"

# create a user
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# final step
mysql -u root -e "FLUSH PRIVILEGES;"
