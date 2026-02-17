#!/bin/bash
echo "Connecting to DB: $DB_NAME as $DB_USER on host $DB_HOST"
if [ ! -f wp-config.php ]; then
    echo "start building wordpress..."
    echo "start building wordpress..."
    wp core download                   \
        --allow-root

    sleep 3

    wp config create                   \
        --dbname=$DB_NAME              \
        --dbuser=$DB_USER              \
        --dbhost=$DB_HOST              \
        --dbpass=$DB_USER_PASSWORD     \
        --allow-root
    
    wp core install                    \
        --url=              $WP_DOMAIN \
        --title=            $WP_TITLE  \
        --admin_user=       $WP_ADMIN  \
        --admin_email=      $WP_EMAIL  \
        --admin_password=   $WP_PASS   \
        --skip-email                   \
        --allow-root
fi

/usr/sbin/php-fpm8.2 -F