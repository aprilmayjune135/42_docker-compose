#!/bin/bash

if [ $1 == "on" ]
then
	sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/localhost
	service nginx reload
	service nginx restart
elif [ $1 == "off" ]
then
	sed -i 's/autoindex on/autoindex off/g' etc/nginx/sites-available/localhost
	service nginx reload
	service nginx restart
else
	echo "Error. Incorrect input."
fi
