#!/bin/bash

if [ ! -f wp-config.php ]; then

    echo "      <-- Start wordPress configuration -->"

    wp core download --allow-root

    echo "      <-- wordPress files downloaded -->" 

    wp config create              \
        --dbname="$DB_NAME"        \
        --dbuser="$DB_USER"         \
        --dbhost="$DB_HOST"          \
        --dbpass="$DB_USER_PASSWORD"  \
        --allow-root

    echo "      <-- wp-config file created for database connection -->" 

    wp core install           \
        --url="$WP_DOMAIN"     \
        --title="$WP_TITLE"     \
        --admin_user="$WP_ADMIN" \
        --admin_email="$WP_EMAIL" \
        --admin_password="$WP_PASS"\
        --skip-email                \
        --allow-root

    echo "--=-- Registration done -->" 

    echo "<-- WordPress configuration completed -->"
else
    echo "<-- WordPress is already configured -->"
fi

/usr/sbin/php-fpm8.2 -F