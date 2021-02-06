/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root < "/query.sql"
mysql -u root < "wordpress.sql"
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
telegraf
while true;
do
    sleep 2
done