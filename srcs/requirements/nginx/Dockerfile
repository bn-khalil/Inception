FROM alpine:3.22

RUN apk update && apk add nginx

EXPOSE 90001

CMD ["nginx", "-g", "daemon off;"]