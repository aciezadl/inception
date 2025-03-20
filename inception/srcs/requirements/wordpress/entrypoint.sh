#!/bin/bash
set -e  # Stoppe le script en cas d'erreur

TIMEOUT=120

# Attente de MariaDB
echo "📌 Attente de MariaDB..."
until mysql -h"$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1" &>/dev/null; do
    echo "⏳ En attente de MariaDB... (test de connexion échoué)"
    sleep 2
    TIMEOUT=$((TIMEOUT - 2))
    echo "⏳ En attente de MariaDB... (temps restant: $TIMEOUT secondes)"
    if [ "$TIMEOUT" -le 0 ]; then
        echo "❌ Échec : MariaDB ne répond pas !"
        exit 1
    fi
done
echo "✅ MariaDB est prêt !"

# Vérifier si WordPress est installé
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "📌 Création du fichier wp-config.php..."
    wp config create --allow-root \
        --path=/var/www/html  \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$MYSQL_HOST \
        --skip-check
else
    echo "✅ wp-config.php déjà existant, aucune modification."
fi

# Correction des permissions
echo "📌 Correction des permissions..."
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Vérifier si le dossier PHP-FPM existe
mkdir -p /run/php

# Lancer PHP-FPM
echo "📌 Lancement de PHP-FPM..."
exec php-fpm8.2 -F
