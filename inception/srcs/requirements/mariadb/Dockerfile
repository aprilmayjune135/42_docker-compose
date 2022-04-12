# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt-get update; \
		apt-get upgrade -y

# install mariadb
RUN 	apt-get purge mysql* ; \
		apt-get purge mariadb*
RUN		apt-get autoremove ; \
		apt-get autoclean
RUN		apt-get install mariadb-server -y

# configure 
COPY 	./tools/* ./
COPY 	/conf/my.cnf /etc/my.cnf
COPY 	/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306
RUN 	chmod -R 755 /setup_mysql.sh
RUN 	chmod -R 755 /start.sh
ENTRYPOINT [ "sh", "-c", "/start.sh" ]
