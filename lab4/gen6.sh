#!/bin/bash
while true; do
	read LINE
	case $LINE in
		TERM)
			kill -SIGTERM  $(cat .pid)
			;;
		 "QUIT" | "q" | "quit" )
			 kill $(cat .pid)
			;;
		*)
			echo "$LINE" >> forproc6.txt
			;;
	esac
done 	
