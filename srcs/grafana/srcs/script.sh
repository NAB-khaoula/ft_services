
#to execute the grafana-server binary, it needs the working directory to be the root install directory where the binary and the public folder are located.
telegraf & ./grafana-7.3.7/bin/grafana-server -homepath ./grafana-7.3.7

sleep 2

while true;
do
		if ! pgrep telegraf; then
				echo "telegraf is not running !"
				exit 1
		fi
		if !pgrep grafana-server; then 
				echo "grafana is not running !"
				exit 1
		fi
		sleep 2
done
