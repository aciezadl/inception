# Utiliser l'image Debian comme base
FROM debian

# Mettre à jour les paquets et installer Nginx, PHP et PHP-FPM
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx php-fpm php-mysql php-xml php-mbstring php-curl wget iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Copier le fichier de configuration Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Vérifier que PHP-FPM et Nginx sont installés
RUN php -v && nginx -v

# Démarrer Nginx et PHP-FPM
CMD ["nginx", "-g", "daemon off;"]
