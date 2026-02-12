FROM alpine:3.22

RUN apk update && apk add nginx

COPY . .

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]