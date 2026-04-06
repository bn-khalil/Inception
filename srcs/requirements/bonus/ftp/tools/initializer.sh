#!/bin/bash

adduser $FTP_USER --disabled-password --gecos ""

echo "$FTP_USER:$(cat /run/secrets/ftp_password)" | chpasswd

chown -R $FTP_USER /var/www/wordpress

mkdir -p /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd.conf