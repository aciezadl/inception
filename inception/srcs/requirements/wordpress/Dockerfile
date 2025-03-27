# Utiliser Debian comme base
FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y php-fpm \
    php-fpm \
    php-mysql \
    mariadb-client

RUN php --version

# telecharger wordpress
RUN wget https://fr.wordpress.org/wordpress-6.7.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.7.2-fr_FR.tar.gz && rm wordpress-6.7.2-fr_FR.tar.gz
RUN	chown -R www-data:www-data /var/www/wordpress && chmod -R 755 /var/www/wordpress

# Copier la configuration PHP-FPM
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

# telecharger wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php -p

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh

WORKDIR /var/www/wordpress

ENTRYPOINT [ "sh", "/usr/local/bin/auto_config.sh" ]

# CMD ["/usr/sbin/php-fpm7.3", "-F"]