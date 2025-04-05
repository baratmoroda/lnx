#!/bin/bash
planet_name=$(echo "$1")
declare -A planets=(
	["Mercury"]=0
	["Venus"]=0
	["Earth"]=1
	["Mars"]=2
	["Jupiter"]=98
	["Saturn"]=83
	["Uranus"]=27
	["Neptune"]=14
)

if [ -z "${planets[$planet_name]}" ]; then
	echo "Unknown planet"
	exit 1
else
	echo "${planets[$planet_name]}"
fi
