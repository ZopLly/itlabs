#!/bin/bash
found=0
for i in 0 1 2 3 4 5 6 7; do
	Backup="Backup-$(date -d "$i days ago" +%F)"
	if [ -d "$HOME/$Backup" ]; then
		echo "Latest backup found($i days old): $Backup"
		found=1
		break
	fi
done
if [ "$found" -eq 1 ]; then 
	for file in "$HOME/$Backup/"*; do
		Basename=$(basename $file)
		case "$file" in
			*.????-??-??)
				continue
				;;
			*)
				if [ ! -d "$HOME/restore" ]; then 
					mkdir "$HOME/restore"
				fi
				cp "$file" "$HOME/restore/"
				echo "transfered $Basename in $HOME/restore/" 
				;;
		esac
	done
fi
