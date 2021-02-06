FROM alpine:3.12.3


RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories

RUN apk add nginx openrc telegraf
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf

RUN rc-status && touch /run/openrc/softlevel
RUN rc-status
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session php7-mbstring
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /www
RUN chmod -R 777 /www/wordpress
COPY ./srcs/script.sh /script.sh
COPY ./srcs/wp-config.php /www/wordpress/wp-config.php
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN chmod +x /script.sh
EXPOSE 5050
ENTRYPOINT sh script.sh