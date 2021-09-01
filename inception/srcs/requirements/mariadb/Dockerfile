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

COPY 	./tools/* ./
RUN 	mv ./my.cnf	/etc/my.cnf
RUN 	service mysql start

EXPOSE	3306

ENTRYPOINT [ "mysqld", "--user=root", "--init_file=/init_file" ]



# setup mysql database for wordpress
#COPY 	./tools/start.sh ./
#RUN 	chmod 775 ./start.sh
#RUN 	bash ./start.sh
#CMD	bash ./setup.sh
#RUN	mysql < /create_tables.sql
#RUN 	chown -R mysql:mysql /var/lib/mysql
#RUN 	service mysql start
#RUN		echo "CREATE DATABASE wordpress;" | mysql -u root
#RUN		echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
#RUN		echo "FLUSH PRIVILEGES;" | mysql -u root
