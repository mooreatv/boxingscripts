#! /usr/bin/bash
# Copies addon toplevel setting from one source account to all others
# (syncs addon settings) by moorea@ymail.com
# OpenSource, LGPLv3 License, No Warranties
wowdir="/c/Program Files (x86)/World of Warcraft/_retail_/WTF/Account"
src="$wowdir/$1/SavedVariables/$2.lua"

if [[ ! -f "$wowdir/$1/SavedVariables/$2.lua" ]]; then
    echo "Not found src account=$1 and addon=$2 dir in $wowdir"
    echo "Usage: $0 SrcAccount Addon"
    exit 1
fi

echo "Copying from $1 to all other dirs for $2"

for d in $(cd "$wowdir"; ls -1); do
    if [[ "$d" == "SavedVariables" ]]; then
        echo "Skipping toplevel SavedVariables"
        continue
    fi
    if [[ "$d" == "$1" ]]; then
        echo "Skipping source $d"
        continue
    fi
    echo "working on $d"
    cp --backup "$src" "$wowdir/$d/SavedVariables/"
done
