From debian:buster

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install wget

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN apt install curl -y
run mkdir -p /var/www/html
RUN	chown -R root:root /var/www/html

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /tmp && \
    tar -xzf /tmp/wordpress-6.0-fr_FR.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/wordpress-6.0-fr_FR.tar.gz


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


RUN chown -R www-data:www-data /var/www/html
RUN  find /var/www/html -type d -exec chmod 755 {} \;
RUN  find /var/www/html -type f -exec chmod 644 {} \;
RUN mkdir -p /run/php && chown www-data:www-data /run/php
COPY conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf      etc/php/7.3/fpm/pool.d

# Set correct permissions
RUN chown www-data:www-data /var/www/html/wp-config.php && \
    chmod 644 /var/www/html/wp-config.php

EXPOSE 9000

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]
# CMD ["php-fpm", "-F"]
# CMD ["tail", "-f", "/dev/null"]