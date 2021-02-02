FROM alpine:3.12.3

RUN apk update
RUN apk add openrc

RUN apk search mariadb

RUN apk add mariadb mariadb-common mariadb-client


COPY ./query.sql /query.sql
COPY ./script.sh /script.sh

RUN rc-status
RUN touch /run/openrc/softlevel
RUN chmod +x /script.sh

ENTRYPOINT sh script.sh 