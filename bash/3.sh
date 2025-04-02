#!/bin/bash

for file in "$@"; do
	if [ -f "$file" ]; then
		count=$(wc -l < "$file" | awk '{print $1}')
		echo "the number of lines in $file = $count"
	else
		echo "$file => not found" 
		exit 1
	fi
done
