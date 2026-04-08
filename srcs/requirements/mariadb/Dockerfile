FROM debian:12

RUN apt-get update \
    && apt-get -y install \
    mariadb-server \
    mariadb-client

COPY tools/db-builder.sh /usr/local/bin/db-builder.sh

RUN chmod +x /usr/local/bin/db-builder.sh

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["db-builder.sh"]