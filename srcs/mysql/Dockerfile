FROM alpine:3.12.3

RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories

RUN apk add openrc telegraf
RUN rc-status && touch /run/openrc/softlevel

#Check for package names that match mariadb:
RUN apk search mariadb

RUN apk add mariadb mariadb-common mariadb-client

#to create the database wordpress
COPY ./srcs/query.sql /query.sql
#filling the database
COPY ./srcs/wordpress.sql /wordpress.sql

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/script.sh /script.sh

ENTRYPOINT sh script.sh 