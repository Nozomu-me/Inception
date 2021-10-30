FROM alpine:3.13
RUN apk update
RUN apk upgrade
RUN apk add --update nodejs npm
RUN npm install http-server -g
COPY index.html /tmp
CMD cd tmp && http-server