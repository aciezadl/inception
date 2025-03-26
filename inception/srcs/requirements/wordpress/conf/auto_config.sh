#!/bin/bash

set -e

sleep 10

if [ -e /var/www/wordpress/wp-config.php ]
then
    echo "Mon fichier existe"
else
    wp config create  --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost="mariadb:3306" --path='/var/www/wordpress'
fi

mkdir /run/php -p

exec /usr/sbin/php-fpm7.3 -F