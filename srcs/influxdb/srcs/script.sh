
rc-service influxdb start

telegraf &

sleep 2

while true;
do
        if ! pgrep influx; then
                echo "service influxdb stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done