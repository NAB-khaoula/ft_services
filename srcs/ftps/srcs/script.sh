
rc-service vsftpd start

telegraf &

sleep 2

while true;
do
        if ! pgrep vsftpd; then
                echo "service vsftpd stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done