#!/bin/bash
echo $$ > .pid
echo "you've entered to modechanger. Write down user1, user2, sigterm in generator"
echo "user1 is summ 1 +2+2+.. etc"
echo "user2 is multiplying 1 * 2 * 2... etc"
echo "sigterm is ending process" 
Mode="user1"
usr1(){
	Mode="user1"
}
usr2(){
	Mode="user2"
}
A=1
sigt(){
	Mode="sigterm"
}
trap us1 USR1
trap usr2 USR2
trap sigt SIGTERM
echo "$A"
while true; do
	sleep 1
	case $Mode in
		"user1")
			let A+=2
			echo "$A"
			;;
		"user2")
			let A*=2
			echo "$A"
			;;

		"sigterm")
			echo "Ending this process in term of sended signal" 
			exit
			;;
	esac
done

