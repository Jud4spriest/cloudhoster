FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
 nginx \
 php-fpm \
 php-cli \
 php-mysql \
 mariadb-client \
 vsftpd \
 postfix \
 dovecot-core \
 dovecot-imapd \
 dovecot-pop3d \
 dovecot-lmtpd \
 roundcube \
 roundcube-core \
 roundcube-mysql \
 curl \
 ca-certificates \
 net-tools \
 iputils-ping \
 sudo \ 
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://wordpress.org/latest.tar.gz | tar -xz -C /var/www/html --strip-components=1 && \
chown -R www-data:www-data /var/www/html

# Config safe dirs and permissions for www-data 
RUN mkdir -p /var/www/html /run /var/lib/php /var/lib/nginx /var/log/nginx  && \
    chown -R www-data:www-data /var/www/html /run /var/lib/php /var/lib/nginx /var/log/nginx && \
    chmod -R 755 /var/www/html /run /var/lib/php /var/lib/nginx /var/log/nginx
# cache dir for nginx (if VM's nginx not controlling traffic cache)
RUN mkdir -p /var/cache/nginx && chown www-data:www-data /var/cache/nginx

# apply php optimizations
RUN PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;") && \
    sed -i 's/^;opcache.enable=/opcache.enable=1/' /etc/php/$PHP_VERSION/fpm/php.ini && \
    sed -i 's/^;opcache.memory_consumption=/opcache.memory_consumption=128/' /etc/php/$PHP_VERSION/fpm/php.ini && \
    sed -i 's/^;opcache.max_accelerated_files=/opcache.max_accelerated_files=4000/' /etc/php/$PHP_VERSION/fpm/php.ini && \
    sed -i 's/^;opcache.validate_timestamps=/opcache.validate_timestamps=0/' /etc/php/$PHP_VERSION/fpm/php.ini

# Copy config files to container
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/postfix.conf /etc/postfix/main.cf
COPY conf/dovecot.conf /etc/dovecot/dovecot.conf
COPY conf/roundcube.conf /etc/roundcube/config.inc.php
#COPY scripts/roundcube-init.sh /roundcube-init.sh
#COPY scripts/start.sh /start.sh

EXPOSE 80 443 465 587 993 995 21 30000-30100

WORKDIR /var/www/html

#ENTRYPOINT ["/start.sh"]
#CMD ["tail", "-f", "/dev/null"]