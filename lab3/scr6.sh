#!/bin/bash
for file in /proc/[0-9]*
do
	PiD=$(grep "^Pid:" $file/status | awk '{print $2}');
	ParentPiD=$(grep "^PPid:" $file/status | awk '{print $2}');
	AvrT=$(cat $file/schedstat | awk '{print $2/$3}');
	echo "ProcessID=$PiD : Parental_ProcessID=$ParentPiD : Average_Time=$AvrT"
done | sort -k2 | awk '{print $3, $5}'  > tmp.txt  

cat tmp.txt |while read line
do
	if [ -z "previd" ]
	then previd=$newid
	fi 
	newid=$(echo "$line" | awk '{print $1}')
	tim=$(echo "$line" | awk '{print $2}')	
	if [ "$previd" != "$newid" ] 
	then
		echo "Average_Sleeping_Children_of_PPID=$previd is $((summar / count))"
		summar=0
		count=0
	fi 
	summar=$((tim + summar))
	count+=$((count + 1))
done
echo "Average_Sleeping_Children_of_PPID=$previd is $((summar / count))"

