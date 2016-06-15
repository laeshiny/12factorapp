#!/usr/bin/env bash

echo "This is systemd test"
echo "sudo systemctl (status|start|stop|restart|enable|disable) service_name"
SLEEP_TIME=2

case $1 in
	"init")
		sudo cp 12factor_normal.service /etc/systemd/system/
		sudo cp 12factor_error.service /etc/systemd/system/
		;;

	"normal")
		echo "#####################################################"
		echo "### Run 12factor_normal.service                   ###"
		echo "#####################################################"
		sudo systemctl start 12factor_normal.service

		echo "#####################################################"
		echo "### Check status 12factor_normal.service          ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		sudo systemctl status 12factor_normal.service -l

		echo "#####################################################"
		echo "### Check Journal                                 ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		journalctl -u 12factor_normal.service

		echo "#####################################################"
		echo "### Check stop 12factor_normal.service            ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		sudo systemctl stop 12factor_normal.service

		echo "#####################################################"
		echo "### Check status 12factor_normal.service          ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		sudo systemctl status 12factor_normal.service -l

		;;

	"error")
		echo "#####################################################"
		echo "### Run 12factor_error.service                    ###"
		echo "#####################################################"
		sudo systemctl start 12factor_error.service

		echo "#####################################################"
		echo "### Check status 12factor_error.service           ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		sudo systemctl status 12factor_error.service -l

		echo "#####################################################"
		echo "### Check Journal                                 ###"
		echo "#####################################################"
		journalctl -u 12factor_error.service

		echo "#####################################################"
		echo "### Check stop 12factor_error.service             ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		sudo systemctl stop 12factor_error.service

		echo "#####################################################"
		echo "### Check status 12factor_error.service           ###"
		echo "#####################################################"
		sleep ${SLEEP_TIME}
		sudo systemctl status 12factor_error.service -l

		;;

	*)
		echo "./run.sh (normal|error)"
		;;
esac