FROM alpine:3.22

RUN apk update && apk add nginx
RUN apk add openssl

RUN mkdir -p /var/www/html /etc/nginx/ssl/private /etc/nginx/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/bn.key \
    -out /etc/nginx/ssl/certs/bn.crt \
    -subj "/C=MA/L=Khouribga/O=1337/CN=kben-tou.42.fr"

COPY bn.html /var/www/html
COPY s-l1200.jpg /var/www/html

COPY nginx.conf /etc/nginx/http.d

RUN mkdir -p /run/nginx

CMD ["nginx", "-g", "daemon off;"]