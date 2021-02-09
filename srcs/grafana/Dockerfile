FROM alpine:3.12.3
RUN apk update

EXPOSE 3000

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk add wget libc6-compat telegraf

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.7.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.3.7.linux-amd64.tar.gz
RUN rm -f grafana-enterprise-7.3.7.linux-amd64.tar.gz

COPY ./srcs/script.sh /script.sh
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/grafana.db  /grafana-7.3.7/data/grafana.db

ENTRYPOINT  sh script.sh