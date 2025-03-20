FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

CMD ["init.sh"]

# RUN mkdir -p /var/run/mysqld && \
#     chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
#     chmod 755 /var/lib/mysql /var/run/mysqld

# RUN test -d /var/lib/mysql/mysql || mysql_install_db --user=mysql --datadir=/var/lib/mysql

# COPY init.sql /docker-entrypoint-initdb.d/

# COPY my.cnf /etc/mysql/my.cnf
    
# EXPOSE 3306

# CMD ["mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]