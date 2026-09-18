#!/bin/bash
for file in /proc/[0-9]*
do 
	PiD=$(grep "^Pid:" $file/status | awk '{print $2}');
	ParentPiD=$(grep "^PPid:" $file/status | awk '{print $2}');
	AvrT=$(cat $file/schedstat | awk '{print $2/$3}');
	echo "ProcessID=$PiD : Parental_ProcessID=$ParentPiD : Average_Time=$AvrT"
done | sort -k2
