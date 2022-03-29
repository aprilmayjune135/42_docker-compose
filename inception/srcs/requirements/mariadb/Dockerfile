# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt update; \
		apt upgrade -y

# install mariadb
RUN 	apt purge mysql*
RUN 	apt purge mariadb*
RUN		apt autoremove
RUN		apt autoclean
RUN		apt install mariadb-server -y

# configure 
COPY 	./tools/* ./
COPY 	/conf/my.cnf /etc/my.cnf
COPY 	/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306
RUN 	chmod -R 755 /setup_mysql.sh
RUN 	chmod -R 755 /start.sh
ENTRYPOINT [ "sh", "-c", "/start.sh" ]
