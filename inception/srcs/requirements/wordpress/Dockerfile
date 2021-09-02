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

# install wordpress
COPY	./tools/*	./
RUN 	mkdir -p /var/www/html
RUN		wget https://wordpress.org/latest.tar.gz; \
		tar xvf latest.tar.gz; \
		rm latest.tar.gz
RUN 	mv wordpress /var/www/html/
COPY	/conf/wp-config.php /var/www/html/wordpress/wp-config.php
RUN 	chmod -R 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

# configure php-fpm to listen to port 9000 (www.conf set listen=9000)
COPY 	/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE	9000

# to keep php-fpm in the foreground (php-fpm.conf set daemonize=no)
COPY 	/conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN 	mkdir -p /run/php
ENTRYPOINT 	["bash", "start.sh"]


# install wp-cli
#RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
#		chmod +x wp-cli.phar; \
#		mv wp-cli.phar /usr/local/bin/wp; \
#		mkdir /var/www/wordpress; \
#		cd /var/www/wordpress; \
#		wp core download --allow-root
#RUN		wp config create --dbname=wordpress --dbuser=user --dbpass=password --allow-root
#		wp core install --url=https://localhost/wordpress/ --title=be_happy --admin_user=user --admin_email=xchen@student.codam.nl --admin_password=password --allow-root
