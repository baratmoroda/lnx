#!/bin/bash
tasks_path=$1

if [ -e "$tasks_path" ]; then
	 echo "exist!"
	else
	 echo "not exist!"
	 exit 1
fi

cd "$tasks_path"

for dir in */; do
	if [ -d "$dir" ]; then
		dir_name="${dir%/}"
		path="$tasks_path/$dir_name.txt"
		count=$(find "$tasks_path$dir_name" -mindepth 1 -maxdepth 1 | wc -l)
		echo "$count" > "$path"
	fi
done
echo "done!"

