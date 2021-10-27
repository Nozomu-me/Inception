FROM alpine:3.13
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel

#install vsftpd
RUN apk add vsftpd
COPY vsftpd.conf etc/vsftpd/

RUN adduser -D amal
RUN echo -e "amal:amal" | chpasswd

#install supervisord
RUN apk --update add supervisor
COPY supervisord.conf /etc/
CMD ["/usr/bin/supervisord", "-n"]