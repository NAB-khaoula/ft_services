FROM alpine:3.12.3
RUN apk update
RUN apk add openrc
RUN apk add vsftpd
RUN echo -e "kikou\nkikou" | adduser testuser
RUN echo "testuser" > /etc/vsftpd.userlist
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./script.sh /script.sh
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel
EXPOSE 21
ENTRYPOINT sh script.sh