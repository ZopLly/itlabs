#!/bin/bash
count=0
echo "write numbers! to end this process write down even numer."
read num
while (( num % 2 != 0 )) 
do
	read num
       	let count+=1
done 	
echo "amount of yours numbers: $count"
