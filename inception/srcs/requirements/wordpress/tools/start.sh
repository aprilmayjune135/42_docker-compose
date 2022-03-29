#!bin/bash
wp core install --allow-root --url="https://xchen.42.fr/" --path="/var/www/html/" --title="Don't Worry Be Happy!" --admin_user=${WORDPRESS_DB_USER} --admin_email="xchen@student.codam.nl" --admin_password=${WORDPRESS_DB_PASSWORD_USER} && php-fpm7.3 -R

# Note:
# 1. [wp core install...]
#		install wordpress website
# 2. [php-fpm7.3 -R]
# 		Reference: https://manpages.debian.org/testing/php7.3-fpm/php-fpm7.3.8
#		-R Allow pool to run as root (disabled by default)
