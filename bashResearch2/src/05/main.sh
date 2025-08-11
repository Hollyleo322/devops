#!/bin/bash

./check.sh $@

if [[ $? -eq 0 ]] 
then
    if [[ $1 -eq 1 ]]
    then
        ./sort.sh
    elif [[ $1 -eq 2 ]]
    then
        ./uniqueIP.sh
    elif [[ $1 -eq 3 ]]
    then
        ./requestWithErrors.sh
    elif [[ $1 -eq 4 ]]
    then
        ./uniqueIpWithErrors.sh
    else
        echo "Incorrect parameter!"
    fi
fi