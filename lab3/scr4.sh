#!/bin/bash
for file in /proc/[0-9]*
do 
       echo -n "$file: "
       cat $file/statm | awk '{print $2-$3}' 
done 
sort -nr
