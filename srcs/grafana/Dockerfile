FROM alpine:3.12.3

RUN apk update

EXPOSE 3000

#alpine package manager
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk add openrc wget libc6-compat telegraf
RUN rc-status && touch /run/openrc/softlevel

#grafana version 7.3.7
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.7.linux-amd64.tar.gz
RUN rm -f grafana-enterprise-7.3.7.linux-amd64.tar.gz

COPY ./srcs/script.sh /script.sh
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
#dashboard
COPY ./srcs/grafana.db  /grafana-7.3.7/data/grafana.db

ENTRYPOINT  sh script.sh