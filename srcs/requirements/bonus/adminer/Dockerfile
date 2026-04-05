FROM debian:12

WORKDIR /var/www/wordpress

RUN apt-get update && apt-get install -y \
    php8.2-cli \
    php8.2-mysql \
    wget

RUN wget "https://www.adminer.org/latest.php" -O index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/wordpress"]