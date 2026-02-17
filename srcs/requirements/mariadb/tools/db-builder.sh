#!/bin/bash

service mariadb start

sleep 5

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

    echo "Setupping wordpress database..."

    mariadb -u root << EOF

ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';

CREATE DATABASE IF NOT EXISTS $DB_NAME;

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

FLUSH PRIVILEGES;

SHUTDOWN;

EOF
    echo "Stoping mariadb..."
    sleep 5

else
    echo "Database already exists, restart service..."
fi

exec mysqld_safe