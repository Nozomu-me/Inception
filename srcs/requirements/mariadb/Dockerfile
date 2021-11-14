FROM alpine:3.13
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN openrc
RUN touch run/openrc/softlevel

#install supervisor
RUN apk --update add supervisor

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

#install and setup mariadb
RUN apk add mysql mysql-client
COPY setup.sh /tmp/
COPY supervisord.conf /etc/
COPY mariadb-server.cnf /etc/my.cnf.d/
COPY wordpressdb.sql /tmp
CMD sh /tmp/setup.sh

EXPOSE 3306