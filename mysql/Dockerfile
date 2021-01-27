FROM alpine:3.12.3
RUN apk update
RUN apk search mariadb
RUN apk add mariadb mariadb-common mariadb-client
RUN /etc/init.d/mariadb setup
COPY ./query.sql /query.sql
RUN rc-service mariadb start
COPY ./script.sh /script.sh
RUN chmod +x /script.sh
ENTRYPOINT sh script.sh 