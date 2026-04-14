FROM debian:12

RUN apt-get update \
    && apt-get -y install \
    redis-server

COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]