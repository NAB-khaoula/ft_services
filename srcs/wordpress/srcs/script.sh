
rc-service nginx start
rc-service php-fpm7 start

telegraf &

sleep 2

while true;
do
        var_nginx=`rc-service nginx status | grep -c 'stopped'`
        var_php=`rc-service php-fpm7 status | grep -c 'stopped'`
        if [ $var_nginx -eq 1 ]
        then
                echo "service nginx stopped ..."
                exit 1
        fi
        if [ $var_php -eq 1 ]
        then
                echo "service php-fpm7 stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done