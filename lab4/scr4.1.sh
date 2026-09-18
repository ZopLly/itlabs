#!/bin/bash
A=1
while true; do
	let A=$A+1
	echo "$A" > 42.txt
done
