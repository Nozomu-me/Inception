FROM alpine:3.13
RUN apk update
RUN apk upgrade
# RUN apk add openrc
# RUN openrc
# RUN touch run/openrc/softlevel

#install redis
RUN apk --update add redis 
COPY redis.conf /etc/
# CMD redis-server /etc/redis.conf

#install supervisor
RUN apk add supervisor
COPY supervisord.conf /etc/
#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 6379