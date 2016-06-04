#!/usr/bin/env bash


function build {
	echo "#######################################################################"
	echo "### Get package and Build                                           ###"
	echo "#######################################################################"
	make get
	make build
	echo ""
}

function start {
	echo "#######################################################################"
	echo "### Run api server with port 8001                                   ###"
	echo "#######################################################################"
	./bin/api-server 8001 &
	sleep 1  # For showing process message readably
	echo ""

	echo "#######################################################################"
	echo "### Run api server with port 8002                                   ###"
	echo "#######################################################################"
	./bin/api-server 8002 &
	echo ""
}

case $1 in
	"run")
		build
		start
		;;

	"build")
		build
		;;

	"start")
		start
		;;

	"stop")
		killall api-server
		;;

	*)
		echo "arguments: run|build|start|stop"
		;;

esac