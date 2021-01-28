FROM alpine:latest
RUN apk update
RUN apk add grafana 
COPY ./script.sh /script.sh
EXPOSE 3000
ENTRYPOINT  sh script.sh