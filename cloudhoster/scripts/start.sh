#!/bin/bash
echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -h mariadb --silent; do
    sleep 2
done
echo "MariaDB is up! Starting services..."

bash /config/roundcube-init.sh
sudo /usr/sbin/php-fpm8.2 -D

echo "Fixing permissions..."
chown -R appuser:www-data /var/www/html
chmod -R 775 /var/www/html

echo "php-fpm initialized!"
sudo -u appuser /usr/sbin/vsftpd &
sudo -u appuser /usr/sbin/nginx -g "daemon off;"

#tail -f /dev/null