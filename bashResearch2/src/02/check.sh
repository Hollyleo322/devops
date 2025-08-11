#!/bin/bash

if [[ $# -ne 3 ]]
then
    echo "Must be called with 3 parameters: letters for name of directories, letters for name of files, disk usage in MB. Example main.sh az az.az 3Mb"
    exit 1
else
    if ! [[ $1 =~ ^[a-zA-Z]+$ ]]
    then
        echo "$1 isn't a string with only letters of English alphabet."
        exit 1
    else
        size=${#1}
        if [[ $size -gt 7 ]]
        then
            echo "size of $1 is too big, need length less than or equal to 7."
            exit 1
        fi
    fi
    if ! [[ $2 =~ ^[a-zA-Z]+\.[a-zA-Z]+$ ]]
    then
        echo "$2 isn't correct format of file name."
        exit 1
    else
        name=$(echo $2 | awk -F"." '{print $1}')
        extension=$(echo $2 | awk -F"." '{print $2}')
        sizename=${#name}
        sizeextension=${#extension}
        if [[ $sizename -gt 7 ]]
        then
            echo "size of $name is too big, need length less than or equal to 7."
            exit 1
        fi
        if [[ $sizeextension -gt 3 ]]
        then
            echo "size of $extension is too big, need length less than or equal to 3."
            exit 1
        fi
    fi
    if ! [[ $3 =~ ^[0-9]+(mb|MB|mB|Mb)?$ ]]
    then
        echo "Need a number of size in MB. Example 3mb or just 3"
        exit 1
    else
        sizeFile=$(echo $3 | grep -oP '\d+')
        if [[ $sizeFile -gt 100 ]]
        then
            echo "Size of file must be lesser than or equal to 100 MB."
            exit 1
        fi
        if [[ $sizeFile -le 0 ]]
        then
            echo "Size of file must be greater than  0."
            exit 1
        fi
    fi
fi


