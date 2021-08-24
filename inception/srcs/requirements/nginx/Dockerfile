# OS
FROM 	debian:buster

# maintainer
LABEL 	maintainer = "xchen <xchen@student.codam.nl>"

# check and update OS
RUN 	apt update; \
		apt upgrade -y

# install nginx
RUN		apt install -y nginx; \
		apt install -y wget

# configure Nginx to use theh PHP processor
COPY	/conf/nginx.conf /etc/nginx/sites-available/localhost
RUN		ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

# creat self-signed SSL certificate for Nginx
RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"; \
		chmod 775 /etc/ssl/private/nginx-selfsigned.key; \
		chmod 775 /etc/ssl/certs/nginx-selfsigned.crt

# allow Nginx user
RUN		chown -R www-data:www-data /var/www/html

# open port 443
EXPOSE 443

# to run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
