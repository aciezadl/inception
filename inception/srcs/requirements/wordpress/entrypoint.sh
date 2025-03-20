#!/bin/bash
set -e



# Attente de MariaDB
echo "📌 Attente de MariaDB..."
until mysql -h"$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1" &>/dev/null; do
    echo "⏳ En attente de MariaDB..."
    sleep 2
    TIMEOUT=$((TIMEOUT - 2))
    echo "⏳ En attente de MariaDB..."
    if [ "$TIMEOUT" -le 0 ]; then
        echo "❌ Échec : MariaDB ne répond pas !"
        exit 1
    fi
done
echo "✅ MariaDB est prêt !"

# Création du fichier wp-config.php avec WP-CLI
echo "📌 Création du fichier wp-config.php..."
wp config create --allow-root \
    --path=/var/www/html  \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=$MYSQL_HOST \
    --skip-check

# Correction des permissions
echo "📌 Correction des permissions..."
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Lancer PHP-FPM
echo "📌 Lancement de PHP-FPM..."
exec php-fpm8.2 -F
