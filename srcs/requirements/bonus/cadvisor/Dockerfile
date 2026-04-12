FROM debian:12

RUN apt-get update && apt-get install -y curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -o /usr/bin/cadvisor

RUN chmod +x /usr/bin/cadvisor

EXPOSE 8080

CMD ["/usr/bin/cadvisor", "--docker_only=true", "--url_base_prefix=/cadvisor"]