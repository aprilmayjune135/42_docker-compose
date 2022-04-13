#!bin/bash

# build directory for wordpress download/install
mkdir -p ${WORDPRESS_DIR}
chmod -R 755 ${WORDPRESS_DIR}
chown -R www-data:www-data ${WORDPRESS_DIR}

# download wordpress and config for mysql data
wp core download --allow-root --path=${WORDPRESS_DIR}
cp wp-config.php ${WORDPRESS_DIR}/wp-config.php

# install wordpress website
echo ">>>> Wait for mysql to initiating... Please be patient for 10 seconds!"
sleep 10
echo ">>>> HERE WE GO!"
wp core install --allow-root --path=${WORDPRESS_DIR} --url=https://${DOMAIN_NAME} --title="Don't Worry Be Happy!" --admin_user=${WORDPRESS_ADMIN} --admin_email="xchen@student.codam.nl" --admin_password=${WORDPRESS_PASSWORD_ADMIN}
wp user create --allow-root --path=${WORDPRESS_DIR} ${WORDPRESS_USER} "xchen1@student.codam.nl" --role=editor --user_pass=${WORDPRESS_PASSWORD_USER}

# -R Allow pool to run as root (disabled by default)
# Reference: https://manpages.debian.org/testing/php7.3-fpm/php-fpm7.3.8
php-fpm7.3 -R
