#!/bin/bash
echo "$1"
if [ -f "$1" ]; then
	echo "файл поставлен"
	if [ ! -d "$HOME/trash" ]; then 
		mkdir "$HOME/trash"
		echo "директории нет, создаю ее"
	else 
		echo "директории успешно поставлена"
	fi
else
	echo "сначала создайте файл в директории ~/projects/labs/lab5"
	exit 1
fi
count=$(ls "$HOME/trash" | wc -l)
ww=$((count + 1))
ln "$1" "$HOME/trash/${ww}"
fullpath=$(readlink -f "$1")
rm "$1"
echo "$fullpath $ww" >> "$HOME/trash.log" 

