FROM alpine:3.12.3

RUN apk update

#alpine package manager
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk add openrc influxdb telegraf

#openrc
RUN rc-status && touch /run/openrc/softlevel

COPY ./srcs/script.sh /script.sh
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD [ "sh", "script.sh" ]