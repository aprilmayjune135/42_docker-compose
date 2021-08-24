# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt update; \
		apt upgrade -y

# install LEMP
RUN		apt install -y nginx; \
		apt install -y mariadb-server; \
		apt install -y php-fpm php-mysql php-mbstring; \
		apt install -y wget

# configure Nginx to use theh PHP processor
COPY	/srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

# creat self-signed SSL certificate for Nginx
RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"; \
		chmod 775 /etc/ssl/private/nginx-selfsigned.key; \
		chmod 775 /etc/ssl/certs/nginx-selfsigned.crt

# install and configure phpMyAdmin
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz; \
		tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz; \
		mv phpMyAdmin-4.9.7-all-languages /var/www/html/phpmyadmin; \
		rm phpMyAdmin-4.9.7-all-languages.tar.gz; \
		chown -R www-data:www-data /var/www/html/phpmyadmin
COPY	/srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
RUN		chmod 660 /var/www/html/phpmyadmin/config.inc.php

# setup mysql database for wordpress
RUN 	service mysql start; \
		echo "CREATE DATABASE wordpress;" | mysql -u root; \
		echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root; \
		echo "FLUSH PRIVILEGES;" | mysql -u root

# install wordpress
RUN 	service mysql start; \
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
		chmod +x wp-cli.phar; \
		mv wp-cli.phar /usr/local/bin/wp; \
		mkdir /var/www/html/wordpress; \
		cd /var/www/html/wordpress; \
		wp core download --allow-root; \
		wp config create --dbname=wordpress --dbuser=user --dbpass=password --allow-root; \
		wp core install --url=https://localhost/wordpress/ --title=be_happy --admin_user=user --admin_email=xchen@student.codam.nl --admin_password=password --allow-root

# set autoindex
COPY 	/srcs/autoindex.sh /autoindex.sh
RUN 	chmod +x /autoindex.sh

# allow Nginx user
RUN		chown -R www-data:www-data /var/www/html

# open port 80 and 443
EXPOSE 80 443

# start services
CMD		service nginx start; \
		service php7.3-fpm start; \
		service mysql start; \
		bash
