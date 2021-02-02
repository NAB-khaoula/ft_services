
FROM alpine:3.12.3

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 80 443 22

#updating system
RUN apk update

#adding nginx
RUN apk add nginx openrc --no-cache

#
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

#
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/index.html /www/index.html

#
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel

#
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#
RUN apk add openssh && rc-update add sshd default && rc-status 
COPY ./srcs/sshd_config /etc/ssh/sshd_config
RUN echo -e "1337\n1337" | adduser testuser

#
RUN rc-update add nginx default

#
COPY ./srcs/script.sh /script.sh
CMD [ "sh", "script.sh" ]