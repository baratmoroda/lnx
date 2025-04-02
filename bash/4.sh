#!/bin/bash
planet_name=$(echo "$1")
declare -A planets=(
	["Mercury"]=0
	["Venus"]=0
	["Earth"]=1
	["Mars"]=2
	["Jupiter"]=95
	["Saturn"]=146
	["Uranus"]=27
	["Neptune"]=14
)

if [ -z "${planets[$planet_name]}" ]; then
	echo "error, '$planet_name' does not exist"
	exit 1
else
	echo "planet '$planet_name' has ${planets[$planet_name]} moons"
fi
