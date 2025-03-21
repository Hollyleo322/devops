#!/bin/bash

./check.sh $@
if [[ $? -ne 0 ]]
then
    echo "script must have one argument"
else
    if [[ $1 =~ ^-?[0-9]+$ ]]
    then
        echo "incorrect input argument is a number"
    else
        echo $1
    fi
fi
