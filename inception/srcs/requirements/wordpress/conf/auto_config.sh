#!/bin/bash

# set -e

sleep 8

if [ ! -f /var/www/wordpress/wp-config.php ]
then
    echo "Mon fichier existe pas"
    wp config create  --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost="mariadb:3306" --path='/var/www/wordpress'
    wp core install --allow-root --url=aciezadl.42.fr --title=inception --admin_user=$WORDPRESS_ADMIN --admin_email=$WORDPRESS_EMAIL_ADMIN --admin_password=$WORDPRESS_PASSWORD_ADMIN 
    wp user create --allow-root $WORDPRESS_USER $WORDPRESS_EMAIL --user_pass=$WORDPRESS_PASSWORD
elif [ ! -s /var/www/wordpress/wp-config.php ]
then
    echo "Mon fichier existe mais vide"
    rm -rf /var/www/wordpress/wp-config.php
    wp config create  --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost="mariadb:3306" --path='/var/www/wordpress'
    wp core install --allow-root --url=aciezadl.42.fr --title=inception --admin_user=$WORDPRESS_ADMIN --admin_email=$WORDPRESS_EMAIL_ADMIN --admin_password=$WORDPRESS_PASSWORD_ADMIN 
    wp user create --allow-root $WORDPRESS_USER $WORDPRESS_EMAIL --user_pass=$WORDPRESS_PASSWORD
else
    echo "Mon fichier existe remplis"
fi

# mkdir /run/php -p

exec /usr/sbin/php-fpm7.3 -F