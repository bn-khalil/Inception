#!/bin/bash

if [ ! -f wp-config.php ]; then

    WP_PASS=$(cat /run/secrets/wp_password)
    DB_USER_PASSWORD=$(cat /run/secrets/db_password)

    echo "      <-- Start wordPress configuration -->"

    wp core download --allow-root

    sleep 5
    echo "      <-- creating... wp-config file -->"

    wp config create              \
        --dbname=${DB_NAME}        \
        --dbuser=${DB_USER}         \
        --dbhost=${DB_HOST}          \
        --dbpass=${DB_USER_PASSWORD}  \
        --allow-root

    wp core install           \
        --url="$WP_DOMAIN"     \
        --title="$WP_TITLE"     \
        --admin_user="$WP_ADMIN" \
        --admin_email="$WP_EMAIL" \
        --admin_password="$WP_PASS"\
        --skip-email                \
        --allow-root
    
    # redis settings
    echo "      <-- redis caching configurations -->"

    wp config set WP_CACHE true --raw --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root

    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root

    echo "--=-- Registration done -->" 

    echo "<-- WordPress configuration completed -->"
else
    echo "<-- WordPress is already configured -->"
fi

/usr/sbin/php-fpm8.2 -F