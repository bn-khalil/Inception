#!/bin/bash

if [ ! -f wp-config.php ]; then

    WP_PASS=$(cat /run/secrets/wp_password)
    DB_USER_PASSWORD=$(cat /run/secrets/db_password)

    echo "      <-- Start wordPress configuration -->"

    wp core download --allow-root

    sleep 10

    echo "      <-- creating... wp-config file -->"

    wp config create              \
        --dbname=${DB_NAME}        \
        --dbuser=${DB_USER}         \
        --dbhost=${DB_HOST}          \
        --dbpass=${DB_USER_PASSWORD}  \
        --allow-root --force

    wp core install           \
        --url="$WP_DOMAIN"     \
        --title="$WP_TITLE"     \
        --admin_user="$WP_ADMIN" \
        --admin_email="$WP_EMAIL" \
        --admin_password="$WP_PASS"\
        --skip-email                \
        --allow-root
    
    # redis settings
    echo "      <-- WordPress configuration completed! -->"

    wp config set WP_CACHE true --raw --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root

    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root

    echo "      <-- redis caching configurations completed! -->"
else
    echo "      <-- WordPress is already configured! -->"
fi

chown -R www-data:www-data /var/www/wordpress
chmod -R 775 /var/www/wordpress

/usr/sbin/php-fpm8.2 -F