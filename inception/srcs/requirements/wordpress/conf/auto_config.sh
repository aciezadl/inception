#!/bin/bash

sleep 10

if [ -e /var/www/html/wp-config.php ]
then
    echo "Mon fichier existe"
else
    wp config create  --allowroot \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi