#!/bin/bash

# ----------------------
echo "[Debug] User executing this script: $(whoami)"

if [ -f /.dockerenv ] || grep -qa 'docker' /proc/1/cgroup; then
    echo "[Debug] Running inside the container"
else
    echo "[Debug] Running outside the container (host machine)"
fi
# ----------------------

echo "Fixing container's user permissions..."
chown -R www-data:www-data /var/www/html
chmod -R 750 /var/www/html
#chmod 0666 /run/php/php8.2-fpm.sock

echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -h mariadb --silent; do
    sleep 2
done
echo "MariaDB is up! Starting services..."

echo "running roundcube settings ..."
bash /config/roundcube-init.sh
echo "running php-fpm ..."
bash /config/php-fpm-init.sh

echo "running nginx ..."
sudo -u www-data /usr/sbin/vsftpd &
sudo -u www-data /usr/sbin/nginx -g "daemon off;"

#tail -f /dev/null