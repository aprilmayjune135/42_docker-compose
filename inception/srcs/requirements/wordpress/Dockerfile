# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt update; \
		apt upgrade -y

# install php
RUN		apt install -y php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath; \
		apt install -y wget

# configure php-fpm to listen to port 9000 (www.conf set listen=9000)
COPY 	/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# install wordpress
COPY	./tools/*	./
RUN 	mkdir -p /var/www/html
RUN		wget https://wordpress.org/latest.tar.gz; \
		tar xvf latest.tar.gz; \
		rm latest.tar.gz; \
	 	mv wordpress/* /var/www/html/
COPY	/conf/wp-config.php /var/www/html/wp-config.php

# TODO: create wp user
RUN 	mkdir /var/www/html/wp-content/mu-plugins
#RUN		cp /create-admin-user.php /var/www/html/wp-content/mu-plugins/; \
#		chmod -R 755 /var/www/html/wp-content/mu-plugins/create-admin-user.php

# set permission
RUN 	chmod -R 755 /var/www/html; \
		chown -R www-data:www-data /var/www/html

EXPOSE	9000

# to keep php-fpm in the foreground (php-fpm.conf set daemonize=no)
COPY 	/conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN 	mkdir -p /run/php
ENTRYPOINT 	["bash", "start.sh"]
