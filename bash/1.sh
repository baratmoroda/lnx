#!/bin/bash

count=$1
file=$2

while [ $count -ne 0 ]
do
	loadavg=$(cat /proc/loadavg)
	dt=$(date '+%Y.%d.%m %H:%S')
	echo "$dt $loadavg" >> "$2"
	((count--))
	sleep 1
done
echo "the end!"
