# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt-get update; \
		apt-get upgrade -y

# install nginx
RUN		apt-get install -y nginx; \
		apt-get install -y wget

# configure Nginx to use theh PHP processor
COPY	/conf/nginx.conf /etc/nginx/sites-available/xchen.42.fr
RUN		ln -s /etc/nginx/sites-available/xchen.42.fr /etc/nginx/sites-enabled/xchen.42.fr

# creat self-signed SSL certificate for Nginx
RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=xchen.42.fr"; \
		chmod 775 /etc/ssl/private/nginx-selfsigned.key; \
		chmod 775 /etc/ssl/certs/nginx-selfsigned.crt

# allow Nginx user
RUN 	mkdir -p /wordpress
RUN 	chmod -R 755 /wordpress
RUN		chown -R www-data:www-data /wordpress

# open port
EXPOSE 443

# to run nginx in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
