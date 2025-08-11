#!/bin/bash


source ./checkArgumentsThrueRead.sh
./check.sh $@
if [[ $? -eq 0 ]]
then
    if [[ $1 -eq 1 ]]
    then
         ./readingLogfile.sh $@
    fi
    if [[ $1 -eq 2 ]]
    then
        ./deletingThrueDate.sh $@
    fi
    if  [[ $1 -eq 3 ]]
    then
        if [[ $# -eq 1 ]]
        then
            single=$(readNameofFile)
        else
            single=$2
        fi
        ./deletingThrueName.sh "$single"
    fi
else
    echo "NE OK"
fi