#!/bin/bash

if [[ $# -gt 3 || $# -lt 1 ]]
then
    echo "Script works with three cases parametr 1, 2 or 3 there is 1 - read from log file can be second parametr a path to log file, 2 - date and time of creation here can be second parametr with start date and time, third parametr end date time pattern like DD.MM.YY-H:M, 3 - mask of name could be second parametr with name of file like aaaa_DDMMYY example qew_010425"
    exit 1
fi

if [[ $1 -gt 3 || $1 -lt 0 ]]
then
    echo "invalid argumet, must be 1 , 2 or 3"
    exit 1
fi
if [[ $1 -eq 1 ]]
then
    if [[ $# -gt 2 ]]
    then
        echo "Here must be one or two argument"
        exit 1
    fi
fi

if [[ $1 -eq 2 ]]
then
    if [[ $# -eq 3 ]]
    then
        if [[ $2 =~ ^[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\:[0-9]+$ && $3 =~ ^[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\:[0-9]+$ ]]
        then
            source ./checkArguments.sh
            checkFirst=$(checkDate $2)
            checkSecond=$(checkDate $3)
            if [[ $checkFirst -eq 1 || $checkSecond -eq 1 ]]
            then
                echo "Incorrect date"
                exit 1
            fi
        else
            echo "Incorrect format of date must be DD.MM.YY-H:M"
            exit 1
        fi
    elif [[ $# -eq 2 ]]
    then
        echo "Must be one or three arguments"
        exit 1
    fi
fi

if [[ $1 -eq 3 ]]
then
    if [[ $# -gt 2 ]]
    then
        echo "Here must be one or two argument"
        exit 1
    elif [[ $# -eq 2 ]]
    then
        source ./checkArguments.sh
        checkNameofFile $2
        if [[ $? -eq 1 ]]
        then
            exit 1
        fi
    fi
fi

if [[ $1 -ne 1 && $1 -ne 2 && $1 -ne 3 ]]
then
    echo "invalid argumet, must be 1 , 2 or 3"
    exit 1
fi