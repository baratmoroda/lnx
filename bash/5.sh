#!/bin/bash

path="/var/log"


for logfile in $path/*.log; do
	if [ -f "$logfile" ]; then
		last_line=$(tail -n 1 $logfile)
		echo "$last_line" >> logs.log
	fi
done
