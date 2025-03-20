# Utiliser l'image de base Debian
FROM debian

# Mettre à jour les paquets et installer PHP, les extensions nécessaires, et iputils-ping
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql php-xml php-mbstring php-curl wget curl && \
    rm -rf /var/lib/apt/lists/*

# Télécharger et installer WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Télécharger et installer WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm -rf latest.tar.gz
    
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Créer le répertoire /var/www/html s'il n'existe pas déjà
RUN mkdir -p /var/www/html
    
# Déplacer le dossier wordpress dans /var/www/html
RUN mv wordpress /var/www/html
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 755 /var/www/html/wordpress

# Copier le script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Définir le script comme point d'entrée
ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm8.2", "-F"]