#!/bin/bash

echo "Verifing if Roundcube's database already configured..."
if [ ! -f /config/roundcube_db_initialized ]; then
    echo "Running Roundcube's initialize script..."
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" roundcube < /usr/share/roundcube/SQL/mysql.initial.sql
    touch /config/roundcube_db_initialized
else
    echo "Roundcube's database is ready."
fi