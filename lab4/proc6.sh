#!/bin/bash
echo $$ > .pid
Mode="rabota"
A=1
sigt(){
	Mode="sigterm"
}
trap sigt SIGTERM
while true; do
	case $Mode in
		"rabota")
			:
			;;
		"sigterm")
			echo "stopped by SIGTERM"
			exit
			;;
	esac
	sleep 1
done 	
