/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root < "/query.sql"
mysql -u root < "/wordpress.sql"
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
telegraf &

sleep 2

while true;
do
        var_mariadb=`rc-service mariadb status | grep -c 'stopped'`
        if [ $var_mariadb -eq 1 ]
        then
                echo "service mariadb stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done