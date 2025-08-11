#!/bin/bash

source ./creatingName.sh

if [[ ${#1} -eq 1 ]]
then
    name=$(createNameOneletter $1 $2)
elif [[ ${#1} -eq 2 ]]
then
    name=$(createNameTwoletters $1 $2)
elif [[ ${#1} -eq 3 ]]
then
    name=$(createNameThreeletters $1 $2)
elif [[ ${#1} -eq 4 ]]
then
    name=$(createNameFourletters $1 $2)
elif [[ ${#1} -eq 5 ]]
then
    name=$(createNameFiveletters $1 $2)
elif [[ ${#1} -eq 6 ]]
then
    name=$(createNameSixletters $1 $2)
elif [[ ${#1} -eq 7 ]]
then
    name=$(createNameSevenletters $1 $2)
fi
if [[ $# -eq 2 ]]
then
    echo "$name $(date "+%d%m%y")" | awk '{printf("%s_%s", $1, $2)}'
elif [[ $# -eq 3 ]]
then
    echo "$name $(date "+%d%m%y") $3" | awk '{printf("%s_%s.%s", $1, $2, $3)}'
fi