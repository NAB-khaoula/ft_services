rc-service nginx start
rc-service sshd start
telegraf &

sleep 2

while true;
do
        var_nginx=`rc-service nginx status | grep -c 'stopped'`
        var_ssh=`rc-service sshd status | grep -c 'stopped'`
        if [ $var_nginx -eq 1 ]
        then
                echo "service nginx stopped ..."
                exit 1
        elif [ $var_ssh -eq 1 ]
        then
                echo "service ssh stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done