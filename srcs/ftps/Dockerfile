FROM alpine:3.12.3
EXPOSE 21

RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories

RUN apk add openrc vsftpd openssl telegraf

RUN rc-status && touch /run/openrc/softlevel

RUN echo -e "kikou\nkikou" | adduser testuser
RUN echo "testuser" > /etc/vsftpd.userlist

RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./srcs/script.sh /script.sh
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD [ "sh", "script.sh" ]