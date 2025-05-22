#!/bin/bash

if [ "$FOO" -eq 5 ] && [ "$BAR" -eq 1 ]; then
	exit 1
fi


while true; do
	for file in *; do
		if [ -f "fix.txt" ]; then
			echo "fix.txt created"
			exit 0
		fi
	done

	sleep 1
done
