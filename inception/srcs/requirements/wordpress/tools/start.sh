#!bin/bash

# build directory for wordpress download/install
mkdir -p ${WORDPRESS_DIR}
chmod -R 755 ${WORDPRESS_DIR}
chmod -R www-data:www-data ${WORDPRESS_DIR}

# download wordpress and config for mysql data
wp core download --allow-root --path=${WORDPRESS_DIR}
cp wp-config.php ${WORDPRESS_DIR}/wp-config.php

# install wordpress website
wp core install --allow-root --path=${WORDPRESS_DIR} --url=https://${DOMAIN_NAME} --title="Don't Worry Be Happy!" --admin_user=${WORDPRESS_DB_USER} --admin_email="xchen@student.codam.nl" --admin_password=${WORDPRESS_DB_PASSWORD_USER}

# -R Allow pool to run as root (disabled by default)
# Reference: https://manpages.debian.org/testing/php7.3-fpm/php-fpm7.3.8
php-fpm7.3 -R
