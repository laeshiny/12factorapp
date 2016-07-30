#!/usr/bin/env bash


case $1 in
	"init")
		fluentd -c ./fluent.conf.d -vv &
		;;

	"kill")
		sudo killall fluentd
		;;

	"logging")
		python test_fluentd.py
		;;

	*)
		echo "fluent run script"
		;;
esac
