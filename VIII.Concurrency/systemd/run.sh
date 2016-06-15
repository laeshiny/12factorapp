#!/usr/bin/env bash

echo "This is systemd test"
echo "sudo systemctl (status|start|stop|restart|enable|disable) service_name"

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
		sleep 3
		sudo systemctl status 12factor_normal.service

		echo "#####################################################"
		echo "### Check Journal                                 ###"
		echo "#####################################################"
		sleep 3
		journalctl -u 12factor_normal.service

		echo "#####################################################"
		echo "### Check stop 12factor_normal.service            ###"
		echo "#####################################################"
		sleep 3
		sudo systemctl stop 12factor_normal.service

		echo "#####################################################"
		echo "### Check status 12factor_normal.service          ###"
		echo "#####################################################"
		sleep 3
		sudo systemctl status 12factor_normal.service

		;;

	"error")
		echo "#####################################################"
		echo "### Run 12factor_error.service                   ###"
		echo "#####################################################"
		sudo systemctl start 12factor_error.service

		echo "#####################################################"
		echo "### Check status 12factor_error.service           ###"
		echo "#####################################################"
		sleep 3
		sudo systemctl status 12factor_error.service

		echo "#####################################################"
		echo "### Check Journal                                 ###"
		echo "#####################################################"
		journalctl -u 12factor_error.service

		echo "#####################################################"
		echo "### Check stop 12factor_error.service            ###"
		echo "#####################################################"
		sleep 3
		sudo systemctl stop 12factor_error.service

		echo "#####################################################"
		echo "### Check status 12factor_error.service          ###"
		echo "#####################################################"
		sleep 3
		sudo systemctl status 12factor_error.service

		;;

	*)
		echo "./run.sh (normal|error)"
		;;
esac