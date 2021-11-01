FROM alpine:3.13
RUN apk update && apk upgrade
RUN apk add wget libc6-compat supervisor 
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.2.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-8.2.2.linux-amd64.tar.gz && rm -rf grafana-enterprise-8.2.2.linux-amd64.tar.gz
RUN mv grafana-8.2.2 grafana

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

CMD /usr/bin/supervisord -c /etc/supervisord.conf