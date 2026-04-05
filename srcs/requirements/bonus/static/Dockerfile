FROM debian:12

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y nginx

COPY tools/ .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

