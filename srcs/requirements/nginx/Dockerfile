FROM debian:12

RUN apt-get update \
    && apt-get -y install nginx openssl

RUN mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/bn.key \
    -out /etc/nginx/ssl/certs/bn.crt \
    -subj "/C=MA/L=Khouribga/O=1337/CN=kben-tou.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d/bn.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]