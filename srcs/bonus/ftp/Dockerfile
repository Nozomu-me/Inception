FROM alpine:3.13
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

#install vsftpd
RUN apk add vsftpd 
COPY vsftpd.conf etc/vsftpd/

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

#install supervisord
RUN apk --update add supervisor
COPY supervisord.conf /etc/
COPY passScript.sh /

CMD sh ./passScript.sh && chown -R amouassi:amouassi /home/amouassi/ && /usr/bin/supervisord -n