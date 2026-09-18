#!/bin/bash
today="Backup-$(date +%F)"
tdate=$(date +%F)
found=0
for i in 0 1 2 3 4 5 6 7
do 
	Backup="Backup-$(date -d "$i days ago" +%F)"
	if [ -d "$HOME/$Backup" ]; then
	       echo "you have already directory $i days old, directory wont be updated. all changes gonna be in $Backup"
	       found=1
	       break
	fi
done		
if [ $found -eq 0 ]; then 
	mkdir "$HOME/$today"
	cp "$HOME/source/"* "$HOME/$today"
	{ echo "directory $today was created on $(date +%F) with backups, the list of files copied:"
		ls "$HOME/source" 
	} >> "$HOME/backup-report"
else 
	for file in "$HOME/source/"*; do
		Basename=$(basename "$file")
		if [ -f "$HOME/$Backup/$Basename" ]; then 
			size1=$(stat -c %s "$file")
			size2=$(stat -c %s "$HOME/$Backup/$Basename")
			if [ "$size1" -eq "$size2" ]; then 
				continue
			else 
				mv "$HOME/$Backup/$Basename" "$HOME/$Backup/$Basename.$(date +%F)"
				cp "$file" "$HOME/$Backup/"
				echo "appended $Backup on $tdate : $Basename, $Basename.$(date +%F)" >> "$HOME/backup-report"	
			fi
		else 
			cp "$file" "$HOME/$Backup/"
			echo "added $Basename in $Backup on $tdate" >> "$HOME/backup-report"	
		fi
	done	  
fi
				   		

