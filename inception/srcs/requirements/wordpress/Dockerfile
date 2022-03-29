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

# open gate
EXPOSE	9000

# install wp-cli to install webpage in start.sh
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
		chmod +x wp-cli.phar; \
		mv wp-cli.phar /usr/local/bin/wp

# prepare necessary files
COPY	/conf/wp-config.php ./
COPY	/tools/start.sh	./

# to keep php-fpm in the foreground (php-fpm.conf set daemonize=no)
COPY 	/conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN 	mkdir -p /run/php
ENTRYPOINT 	["bash", "start.sh"]
