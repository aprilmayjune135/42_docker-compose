#!bin/bash

# service has to be started in order to process the setup
service mysql start

# create the database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

# create a user as admin
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_ADMIN}';"

# create a second user
mysql -u root -e "CREATE USER IF NOT EXISTS  '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD_USER}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD_USER}';"

# final step
mysql -u root -e "FLUSH PRIVILEGES;"
