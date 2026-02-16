FROM debian:12

RUN apt-get update \
    && apt-get -y install \
    mariadb-server \
    mariadb-client

COPY tools/db-builder.sh /usr/local/bin/db-builder.sh

RUN chmod +x /usr/local/bin/db-builder.sh

EXPOSE 3306

ENTRYPOINT ["db-builder.sh"]