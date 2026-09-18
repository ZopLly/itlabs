#!/bin/bash
ps -eo pid,command | grep 'sbin/'  | awk '{print $1}' > file.txt && cat file.txt
echo 'please write "cat file.txt" to surf through all processes in sbin/'
