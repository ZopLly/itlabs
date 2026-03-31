#!/bin/bash
result=""
echo " Write your words. To end this proccess print 'q' "
read line
while [[ "$line" != "q" ]]; do 
	result="$result $line"
	read line
done 

echo $result
