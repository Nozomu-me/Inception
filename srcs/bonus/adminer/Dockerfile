FROM alpine:3.13
RUN apk update
RUN apk upgrade
# RUN apk add openrc
# RUN openrc
# RUN touch run/openrc/softlevel
RUN apk add wget

#install php
RUN apk add php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk --update add supervisor
#install adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mkdir adminer && mv adminer-4.8.1.php adminer/index.php
COPY www.conf /etc/php7/php-fpm.d/
COPY supervisord.conf /etc/
CMD if [ ! -d /var/www/adminer ];then mv /adminer /var/www/; fi && /usr/bin/supervisord -n