#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html
wp core download --allow-root

wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --dbprefix=wp_ --allow-root
wp core install --url=${INCEPTION_URL} --title=${INCEPTION_TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root
wp user create ${USER_NAME} ${USER_EMAIL} --role=subscriber --user_pass=${USER_PASSWORD} --allow-root

fi


mkdir -p /run/php


exec "$@"
