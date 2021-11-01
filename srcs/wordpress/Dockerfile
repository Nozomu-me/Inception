FROM alpine:3.13
RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN openrc
RUN touch run/openrc/softlevel

#install wordpress
RUN apk add php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add wget
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
COPY www.conf /etc/php7/php-fpm.d

#install supervisord
RUN apk --update add supervisor
COPY supervisord.conf /etc/
COPY wp-config.php /wordpress/

#install telegraf
RUN apk add telegraf
COPY telegraf.conf /etc/

#install redis cache backend script
RUN apk add unzip
RUN cd /wordpress/wp-content/plugins && wget https://downloads.wordpress.org/plugin/redis-cache.2.0.21.zip && \
	unzip redis-cache.2.0.21.zip && rm -rf redis-cache.2.0.21.zip 
RUN cd /wordpress/wp-content/plugins/redis-cache/includes && cp object-cache.php /wordpress/wp-content/

CMD if [ ! -d /var/www/wordpress ];then mv /wordpress /var/www/; fi && /usr/bin/supervisord -n
