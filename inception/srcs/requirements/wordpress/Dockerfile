# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt update; \
		apt upgrade -y

# install php
RUN		apt install -y php-fpm php-mysql php-mbstring; \
		apt install -y wget

#RUN		service php7.3-fpm start

# install wordpress
COPY	./tools/*	./
RUN 	mkdir -p /var/www
RUN		wget https://wordpress.org/latest.tar.gz; \
		tar xvf latest.tar.gz; \
		rm latest.tar.gz
RUN 	mv wordpress /var/www/wordpress
COPY	/conf/wp-config.php /var/www/wordpress/wp-config.php
RUN		chown -R www-data:www-data /var/www/wordpress
#RUN 	service php7.3-fpm start
EXPOSE	9000

RUN chmod +x /wait-for-it.sh
CMD ["./wait-for-it.sh" , "[ENTER YOUR ENDPOINT HERE]" , "--strict" , "--timeout=300" , "--" , "YOUR REAL START COMMAND"]

#CMD 	["bash", "start.sh"]
