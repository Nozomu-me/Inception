#! /bin/sh
if !(find /var/lib/mysql/ -mindepth 1 -maxdepth 1) | read; then
   /etc/init.d/mariadb setup
   service mariadb restart
   mysql -uroot -e "CREATE DATABASE ${WP_DB};"
   mysql -uroot -e "CREATE USER '${USER}'@'%' IDENTIFIED BY '${USER}';"
   mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${USER}'@'%' WITH GRANT OPTION;"
   mysql -uroot -e "FLUSH PRIVILEGES;"
   mysql -uroot -D $WP_DB < /tmp/wordpressdb.sql
fi
service mariadb stop
/usr/bin/supervisord -c /etc/supervisord.conf