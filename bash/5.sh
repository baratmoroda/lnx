#!/bin/bash

output_file="logs.log"

> "$output_file"

for logfile in /var/log/*.log; do
	if [ -f "$logfile" ]; then
		last_line=$(tail -n 1 "$logfile" 2>/dev/null)
		echo "File: $logfile" >> "$output_file"
		echo "Last line: $last_line" >> "$output_file"
		echo "-------------" >> "$output_file"
	fi
done
echo "results are saved to a file $output_file"
