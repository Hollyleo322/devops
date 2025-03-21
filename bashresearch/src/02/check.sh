#!/bin/bash

if [[ $# -ne 4 ]]
then
    echo "Incorrect number of arguments. Need 4"
    exit 1
else
    for var in $@
    do
        if [[ var -lt 1 || var -gt 6 ]]
        then
            echo "Incorrect parametr"
            exit 1
        fi
    done
    if [[ $1 == $2 || $3 == $4 ]]
    then
        echo "Color of text and color of background in one column the same. Please try again"
        exit 1
    fi
fi