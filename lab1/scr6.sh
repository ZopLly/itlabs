#!/bin/bash
if [ "$PWD" == "$HOME" ]
then echo "$PWD"
	exit 0
else 
	echo "We have some troubles"
	exit 1
fi
