adduser -D $MYSQL_USER
echo -e "$MYSQL_USER:$PASSWORD" | chpasswd