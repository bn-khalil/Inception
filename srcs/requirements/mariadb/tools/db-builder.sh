#!/bin/bash

DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
DB_USER_PASSWORD=$(cat /run/secrets/db_password)

/etc/init.d/mariadb start

sleep 5

if [ ! -d /var/lib/mysql/$DB_NAME ]; then

    echo "Setupping database..."

    mariadb -u root << EOF

    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

    CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';

    CREATE DATABASE IF NOT EXISTS $DB_NAME;

    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

    FLUSH PRIVILEGES;

EOF

else
    echo "Database already exists, restart service..."
fi

mariadb -u root -p$DB_ROOT_PASSWORD -e "SHUTDOWN;"

sleep 5

exec mysqld_safe