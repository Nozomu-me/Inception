FROM alpine:3.13
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN openrc
RUN touch run/openrc/softlevel

# install nginx
RUN apk add nginx
RUN mkdir /run/nginx

COPY nginx.conf /etc/nginx/
# COPY index.html /www/

# install openssl
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=Amouassi"

#install mariadb
RUN apk add mariadb mariadb-client
RUN /etc/init.d/mariadb setup

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

#install supervisord
RUN apk --update add supervisor
COPY supervisord.conf /etc/
CMD ["/usr/bin/supervisord", "-n"]

EXPOSE 80 443