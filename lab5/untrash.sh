#!/bin/bash
echo "$1"
filecheck=$(grep "$1" "$HOME/trash.log")
if [ -n "$filecheck" ]; then 
	echo "файл найден"
else
	echo "создайте файл и удалите его через 1 скрипт" 
	exit 1
fi
grep "$1" "$HOME/trash.log" | while read line; 
do
	link=$(echo "$line" | awk '{print $2}')
	fullname=$(echo "$line" | awk '{print $1}')
	dir=$(dirname "$fullname")
	bsnm=$(basename "$fullname")
	echo "$fullname"
	read -p "Восстановить данный файл?[y/n]" answer
	if [ "$answer" = "y" ]; then 
		if [ -d "$dir" ]; then 
			ln "$HOME/trash/$link" "$fullname"
			rm "$HOME/trash/$link"
			sed -i "/$line/d" "$HOME/trash.log"
			echo "your file locartion: $dir"
			break
		else
			ln "$HOME/trash/$link" "$HOME/$bsnm"
			rm "$HOME/trash/$link"
			sed -i "/$line/d" "$HOME/trash.log"
			echo "didn't find your dir, your file located on home's dir"
			break
		fi 
	else 
		echo "skipped"
	fi
done

