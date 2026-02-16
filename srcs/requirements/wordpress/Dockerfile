FROM debian:12

WORKDIR /var/www/wordpress

RUN apt-get update && apt-get install -y curl php8.2 php8.2-fpm php8.2-mysql

RUN sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
            && chmod +x wp-cli.phar \
            && mv wp-cli.phar /usr/local/bin/wp

COPY tools/wp-builder.sh /usr/local/bin/wp-builder.sh

RUN chmod +x /usr/local/bin/wp-builder.sh

RUN mkdir -p /run/php

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp-builder.sh"]