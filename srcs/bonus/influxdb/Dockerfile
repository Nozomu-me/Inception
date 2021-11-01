FROM alpine:3.13
RUN apk update && apk upgrade
RUN apk add wget openrc
RUN apk --update add supervisor
RUN openrc
RUN touch /run/openrc/softlevel

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

#install influxdb
RUN apk add influxdb
RUN mkdir /usr/local/share/collectd
COPY influxdb.conf /etc/
COPY supervisord.conf /etc
COPY dataSetup.sh /
CMD sh dataSetup.sh
