#!/bin/bash

if [[ $# -ne 6 ]]
then
    echo "Must be called with 6 parameters: directory, number of lines, letters for name of directories, number of files in each created directories, letters for name of files, disk usage in KB. Example main.sh /opt/test 4 az 5 az.az 3kb"
    exit 1
else
    if ! [[ -d $1 ]]
    then
        echo "$1 not such a directory."
        exit 1
    fi
    if ! [[ $2 =~ ^[0-9]+$ ]]
    then
        echo "$2 isn't a number."
        exit 1
    fi
    if ! [[ $3 =~ ^[a-zA-Z]+$ ]]
    then
        echo "$3 isn't a string with only letters of English alphabet."
        exit 1
    else
        size=${#3}
        if [[ $size -gt 7 ]]
        then
            echo "size of $3 is too big, need length less than or equal to 7."
            exit 1
        fi
    fi
    if ! [[ $4 =~ ^[0-9]+$ ]]
    then
        echo "$4 isn't a number."
        exit 1
    fi
    if ! [[ $5 =~ ^[a-zA-Z]+\.[a-zA-Z]+$ ]]
    then
        echo "$5 isn't correct format of file name."
        exit 1
    else
        name=$(echo $5 | awk -F"." '{print $1}')
        extension=$(echo $5 | awk -F"." '{print $2}')
        sizename=${#name}
        sizeextension=${#extension}
        if [[ $sizename -gt 7 ]]
        then
            echo "size of name $name is too big, need length less than or equal to 7."
            exit 1
        fi
        if [[ $sizeextension -gt 3 ]]
        then
            echo "size of extension $extension is too big, need length less than or equal to 3."
            exit 1
        fi
    fi
    if ! [[ $6 =~ ^[0-9]+(kb|KB|kB|Kb)?$ ]]
    then
        echo "Need a number of size in KB."
        exit 1
    else
        sizeFile=$(echo $6 | grep -oP '\d+')
        if [[ $sizeFile -gt 100 ]]
        then
            echo "Size of file must be lesser than or equal to 100 KB."
            exit 1
        fi
        if [[ $sizeFile -le 0 ]]
        then
            echo "Size of file must be greater than 0."
        fi
    fi
fi


