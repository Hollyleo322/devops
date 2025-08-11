#!/bin/bash

function readPath
{
    read -p "Enter the path to the log file "
    echo $REPLY
}

function readDate
{
    read -p "Enter date format DD.MM.YY-H:M "
    source ./checkArguments.sh
    check=$(checkDate $REPLY)
    if [[ check -eq 1 ]]
    then
        echo 1
    elif ! [[ $REPLY =~ ^[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\:[0-9]+$ ]]
    then
        echo 1
    else
        echo $REPLY
    fi
}

function readNameofFile
{
    read -p "Enter the name of the file "
    source ./checkArguments.sh
    checkNameofFile $REPLY
    if [[ $? -eq 1 ]]
    then
        echo 1
    else
        echo $REPLY
    fi
}