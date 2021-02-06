FROM alpine:3.12.3
RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk add openrc influxdb telegraf

RUN rc-status && touch /run/openrc/softlevel

COPY ./srcs/script.sh /script.sh
# COPY ./srcs/influxdb.conf /etc/influx.conf
COPY ./srcs/telegraf.conf /etc/telegraf.conf

ENTRYPOINT  sh script.sh