telegraf &
#After installation we need to initialize the main mysql database
/etc/init.d/mariadb setup
#starting openrc
rc-service mariadb start
mysql -u root < "/query.sql"
mysql -u root < "/wordpress.sql"
#dont search for hostnames to improve performance responses
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart

sleep 2

while true;
do
        if ! pgrep mysql; then
                echo "service mariadb stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done