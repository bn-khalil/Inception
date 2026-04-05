FROM debian:12

RUN apt-get update && apt-get install -y \
    monitorix

RUN sed -i 's/host = 127.0.0.1/host = 0.0.0.0/' /etc/monitorix/monitorix.conf

EXPOSE 8080

CMD ["monitorix", "-c", "/etc/monitorix/monitorix.conf", "-n"]