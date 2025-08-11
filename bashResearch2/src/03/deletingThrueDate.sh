#!/bin/bash
source ./rewriteDate.sh
source ./checkArgumentsThrueRead.sh
if [[ $1 -eq 2 && $# -eq 1 ]]
then
    echo "Start Date"
    first=$(readDate)
    if [[ $first != 1 ]]
    then
        echo "End Date"
        second=$(readDate)
    fi
    if [[ $first != 1 && $second != 1 ]]
    then
        first=$(rewriteDate $first)
        second=$(rewriteDate $second)
        if [[ $(date -d "$first" +%s) -ge $(date -d "$second" +%s) ]]
        then
            echo "first date can't be bigger than second"
        else
            ./cycleDeletingThrueDate.sh "$first" "$second"
        fi
    else
        echo "Incorrect input of date"
    fi
elif [[ $1 -eq 2 && $# -eq 3 ]]
then
    first=$(rewriteDate $2)
    second=$(rewriteDate $3)
    if [[ $(date -d "$first" +%s) -ge $(date -d "$second" +%s) ]]
    then
        echo "first date can't be bigger than second"
    else
        ./cycleDeletingThrueDate.sh "$first" "$second"
    fi
fi
