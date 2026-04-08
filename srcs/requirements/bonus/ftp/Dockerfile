FROM debian:12

RUN apt-get update \
    && apt-get -y install \
    vsftpd

COPY tools/ftp.conf /etc/vsftpd.conf

COPY tools/initializer.sh /usr/local/bin/ftp-init.sh

RUN chmod +x /usr/local/bin/ftp-init.sh

CMD  ["/usr/local/bin/ftp-init.sh"]