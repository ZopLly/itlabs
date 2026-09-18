#!/bin/bash
while true; do
	read LINE
	case $LINE in 
		'"+"')
			kill -USR1 $(cat .pid)
			;;
		"TERM")
			kill -SIGTERM $(cat .pid)
			;;
		'"*"')
			kill -USR2 $(cat ..pid)
			;;
		"q")
			kill $(cat .pid)
			exit
			;;
		*)
			:
			;;
	esac
done
