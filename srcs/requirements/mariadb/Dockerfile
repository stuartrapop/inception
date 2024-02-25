FROM debian:bullseye

# Install MariaDB
RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server  vim -y

# Copy custom configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy an initialization script
COPY init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh


EXPOSE 3306

# Set the entrypoint to initialize the DB and start MariaDB
ENTRYPOINT ["init-db.sh"]