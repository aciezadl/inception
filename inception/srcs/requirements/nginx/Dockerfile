# Utiliser l'image Debian comme base
FROM debian:buster

# Mettre à jour les paquets et installer Nginx, PHP et PHP-FPM
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx php-fpm php-mysql php-xml php-mbstring php-curl wget iputils-ping vim && \
    rm -rf /var/lib/apt/lists/*

# Copier le fichier de configuration Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Vérifier que PHP-FPM et Nginx sont installés
RUN php -v && nginx -v

# Crer le dossier pour stocker le certificat et la clef pour une connexion securise
RUN mkdir -p /etc/nginx/ssl

RUN apt install OpenSSL -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Démarrer Nginx et PHP-FPM
CMD ["nginx", "-g", "daemon off;"]
