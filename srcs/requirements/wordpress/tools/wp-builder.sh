#!/bin/bash

if [ ! -f wp-config.php ]; then
    echo "start building wordpress..."
    wp core download --allow-root
    cp wp-config-sample.php wp-config.php
    # if [ -f wp-config-sample.php ]; then
    # fi
fi

/usr/sbin/php-fpm8.2 -F