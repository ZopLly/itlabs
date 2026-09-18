#!/bin/bash
echo "вы находитесь в самодельном калькуляторе, с функциями постоянного сложения и умножения"
echo "чтобы включить режим суммирования напиши "+", умножения - "*""
echo "to quit you have to wtrite QUIT"
result=1
Mode="summarising"
(tail -n 0 -f forproc.txt) | while true; do
	read LINE
	case $LINE in 
		"QUIT" | "quit" | "q" )
			echo "exiting."
			echo "exiting.."
			echo "exiting..."
			killall tail
			> ./forproc.txt
			exit
			;;
		"+")
			echo "changed your mode to summarising, waiting you to write numbers"
			Mode="summarising"
			;;
		"*")	
			echo "changed to multiplying, write nums"
			Mode="multiplying"
			;;
		*)
		if [[ "$LINE" =~ ^-?[0-9]+$ ]]	 
		then	
			case $Mode in
				"summarising")
					result=$((LINE + result))
					echo "$result"
					;;
				"multiplying")
					result=$((LINE * result))
					echo "$result"
					;;
			esac 
		else
			echo "incorrect input, please write integers or +/*/quit"
		fi 
		;;
	esac 
done 

	
