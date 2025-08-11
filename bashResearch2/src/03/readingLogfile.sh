#!/bin/bash

source ./checkArgumentsThrueRead.sh
if [[ $1 -eq 1 && $# -eq 1 ]]
    then
        path=$(readPath)
elif [[ $1 -eq 1 && $# -eq 2 ]]
    then
        path=$2
fi

if [[ -r $path ]]
then
    awk '{if ($1 ~ /^-/) {printf "%s\n",  substr($1, 3, length($1))} else {printf "%s\n", $1}}' $path | tr -d '\r' |  xargs  rm -rf
else
    echo "No such file or file isn't readable"
fi