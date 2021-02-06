FROM alpine:3.12.3

RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories

RUN apk add openrc telegraf

RUN apk search mariadb

RUN apk add mariadb mariadb-common mariadb-client


COPY ./srcs/query.sql /query.sql
COPY ./srcs/wordpress.sql /wordpress.sql
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/script.sh /script.sh

RUN rc-status && touch /run/openrc/softlevel

RUN chmod +x /script.sh

ENTRYPOINT sh script.sh 