#! /usr/bin/bash
# Copies addon character setting from one source account/realm/character to all others
# matching a pattern
# (syncs addon settings) by moorea@ymail.com
# OpenSource, LGPLv3 License, No Warranties

# edit/change as needed:
wowdir="/c/Program Files (x86)/World of Warcraft/_retail_/WTF/Account"

src="$wowdir/$1/SavedVariables/$2.lua"

function usage {
    echo "Usage: $0 SrcAccount/Realm/Toon Addon pattern"
    echo "eg. $0 \"123456#1/Kil'jaeden/Notbotone\" Vendor */*/Notbot*"
    exit 1
}

if [[ -z $3 ]]; then
    echo "Need to specify non empty 3rd argument: pattern"
    usage
fi

if [[ ! -f "$wowdir/$1/SavedVariables/$2.lua" ]]; then
    echo "Not found src account/realm/toon=$1 and addon=$2 dir in $wowdir"
    usage
fi

echo "Copying from $1 to all other dirs matching $3 for $2"

for d in $(cd "$wowdir"; ls -1d $3); do
    if [[ "$d" == "$1" ]]; then
        echo "Skipping source $d"
        continue
    fi
    echo "working on $d"
    cp --backup "$src" "$wowdir/$d/SavedVariables/"
done
