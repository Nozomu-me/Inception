service influxdb start
influx -execute "CREATE DATABASE collectd;"
service influxdb stop
/usr/bin/supervisord -c /etc/supervisord.conf