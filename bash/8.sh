#!/bin/bash

count=$(env | grep "LC_" | cut -d = -f 2 | uniq | wc -l)
if [ $count -gt 1 ]; then
	echo "256"
	exit 1
fi
