FROM alpine:3.13
RUN apk update
RUN apk upgrade

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

RUN apk add --update nodejs npm
RUN npm install http-server -g
COPY index.html /tmp
CMD cd tmp && http-server