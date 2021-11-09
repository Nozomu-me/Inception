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
# COPY index.html /tmp
COPY app.js /tmp
COPY public /tmp
COPY package.json /tmp

RUN apk add npm
# RUN cd tmp && http-server

WORKDIR /tmp
RUN npm i
ADD public/ public
CMD /usr/bin/supervisord -c /etc/supervisord.conf

# CMD npm i && node app.js
EXPOSE 30001