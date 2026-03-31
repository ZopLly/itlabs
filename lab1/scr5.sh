#!/bin/bash
echo '---Menu---
	1. Nano
	2. Vi
	3. Links
	4. Leave the menu'

read answer
case "$answer" in 
	1 ) nano 
		;;
	2 ) vi 
		;;
	3 ) links 
		;;
	4 ) exit 0
		;;
	* ) echo  'Dont have answer for it, try again' 
		;;
esac 

