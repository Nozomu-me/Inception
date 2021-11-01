FROM alpine:3.13
RUN apk update
RUN apk upgrade

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

#install supervisord
RUN apk add supervisor
COPY supervisord.conf /etc/

RUN apk add --update nodejs
# RUN npm install http-server -g
COPY index.html /tmp
COPY app.js /tmp
# RUN cd tmp && http-server
CMD /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 30001