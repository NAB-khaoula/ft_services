
rc-service influxdb start

telegraf &

sleep 2

while true;
do
        var_influxdb=`rc-service influxdb status | grep -c 'stopped'`
        if [ $var_influxdb -eq 1 ]
        then
                echo "service influxdb stopped ..."
                exit 1
        fi
        if ! pgrep telegraf; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done