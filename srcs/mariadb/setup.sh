#! /bin/sh
if !(find /var/lib/mysql/ -mindepth 1 -maxdepth 1) | read; then
   /etc/init.d/mariadb setup
   service mariadb restart
   mysql -uroot -e "CREATE DATABASE ${WP_DB};"
   mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${PASSWORD}';"
   mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;"
   mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${PASSWORD}';"
   mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' WITH GRANT OPTION;"
   mysql -uroot -e "FLUSH PRIVILEGES;"
   mysql -uroot -D $WP_DB < /tmp/wordpressdb.sql
   mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${RPASSWORD}';"
   service mariadb stop
fi
/usr/bin/supervisord -c /etc/supervisord.conf