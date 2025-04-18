#!/bin/bash

service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
exec mysqld_safe

echo "Initialisation de MariaDB terminée."
