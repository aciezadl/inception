FROM debian

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

ENV MYSQL_ROOT_PASSWORD=password \
    MYSQL_DATABASE=wordpress \
    MYSQL_USER=wordpress_user \
    MYSQL_PASSWORD=userpassword
    
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    chmod 755 /var/lib/mysql /var/run/mysqld

RUN test -d /var/lib/mysql/mysql || mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY init.sql /docker-entrypoint-initdb.d/
    
EXPOSE 3306

CMD ["mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]