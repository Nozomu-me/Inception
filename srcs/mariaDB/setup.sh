#! /bin/sh
if !(find /var/lib/mysql/ -mindepth 1 -maxdepth 1) | read; then
   /etc/init.d/mariadb setup
   service mariadb restart
   mysql -uroot -e "CREATE DATABASE wordpressdb;"
   mysql -uroot -e "CREATE USER 'amouassi'@'%' IDENTIFIED BY 'amouassi';"
   mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'amouassi'@'%' WITH GRANT OPTION;"
   mysql -uroot -e "FLUSH PRIVILEGES;"
fi
service mariadb stop
/usr/bin/supervisord -c /etc/supervisord.conf