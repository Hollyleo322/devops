#!/bin/bash
function checkRootDirectory()
{
    if [[ $(df -h / | awk 'NR==2 {printf "%s", $4}') =~ M+$ ]]
    then
        echo "Free space is not enough in root directory"
        return 1
    fi
}
function checkAnotherDirectory()
{
    if [[ $(df -h $1 | awk 'NR==2 {printf "%s", $4}') =~ G+$ ]]
    then
        return 0
    fi
    if [[ $(df -h $1 | awk 'NR==2 {printf "%s", $4}') =~ M?$ ]]
    then
        availaible=$(df -h $1 | awk 'NR==2 {printf "%d", $4}')
        if [[ $availaible -lt $(echo $2 | awk '{printf "%d", $1}') ]]
        then
            echo "Free space is not enough in this directory $1"
            return 1
        fi
    fi
}