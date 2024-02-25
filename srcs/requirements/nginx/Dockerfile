FROM debian:buster

RUN apt update; \
    apt install -y nginx openssl curl procps

# Create the directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=srapopor.42.fr/UID=login"



COPY ./conf/default.conf etc/nginx/sites-enabled/default


# Ensure permissions
RUN chmod 755 /var/www/html && \
    set -eux; \
    if ! getent group www-data; then addgroup -g 1000 www-data; fi; \
    if ! getent passwd www-data; then adduser -u 1000 -G www-data -s /bin/sh -D www-data; fi; \
    chown -R www-data:www-data /var/www/html

# RUN chmod 755 /var/www/wordpress && \
#     set -eux; \
#     if ! getent group www-data; then addgroup -g 1000 www-data; fi; \
#     if ! getent passwd www-data; then adduser -u 1000 -G www-data -s /bin/sh -D www-data; fi; \
#     chown -R www-data:www-data /var/www/wordpress

# RUN mkdir -p /var/www/wordpress && \
#     chown -R www-data:www-data /var/www/wordpress

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]