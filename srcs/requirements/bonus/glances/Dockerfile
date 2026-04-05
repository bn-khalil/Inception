FROM debian:12

RUN apt-get update && apt-get install -y \
    glances \
    python3-bottle

EXPOSE 61208

CMD ["glances", "-w", "-B", "0.0.0.0"]