#!/usr/bin/env bash


case $1 in
	"init")
		fluentd -c ./fluent.conf.d -vv &
		;;

	"kill")
		kill %1
		kill %2
		;;

	"logging")
		python test_fluentd.py
		;;

	*)
		echo "fluent run script"
		;;
esac