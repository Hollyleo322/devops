#!/bin/bash
function checkNumber(){
    if ! [[ "$1" =~ ^[1-6]+$ ]]
    then
        echo default
    else
        echo $1
    fi
}