#!/bin/bash
function checkIndex()
{
    if [[ $1 = "default" ]]
    then
        echo $2
    else
        echo $1
    fi
}