rc-service nginx start
rc-service sshd start
telegraf &

sleep 2

while true;
do
        if ! pgrep nginx; then
                echo "service nginx stopped ..."
                exit 1
        fi
        if ! pgrep sshd; then
                echo "service ssh stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done