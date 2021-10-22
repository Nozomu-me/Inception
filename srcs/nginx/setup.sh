#! /bin/sh
if !(find /var/lib/mysql/ -mindepth 1 -maxdepth 1) | read; then
   /etc/init.d/mariadb setup
fi