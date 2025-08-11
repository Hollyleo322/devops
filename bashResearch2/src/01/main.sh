#!/bin/bash
source ./checkAvailaibleSpace.sh
./check.sh $@
if [[ $? -eq 0 ]]
then
    size="$(echo $6 | grep -oP '\d+')K"
    for (( i=0; i < $2; i++ ))
    do
        name=$(./creatingNameConditions.sh $3 $2)
        namewithpath="$1/$name"
        while  [[ -d $namewithpath ]]
        do
            name=$(./creatingNameConditions.sh $3 $2)
            namewithpath="$1/$name"
        done
        checkAnotherDirectory $1
        if [[ $? -eq 1 ]]
        then
            exit 1
        fi
        mkdir $namewithpath
        echo "$namewithpath was created $(date "+%d-%m-%y %H:%M:%S")" >> result.log
        for (( j=0; j < $4; j++))
        do
           namefile=$(./creatingNameConditions.sh $(echo $5 | awk -F "." '{print $1}') $4 $(echo $5 | awk -F "." '{print $2}'))
           namefilewithpath="$namewithpath/$namefile"
           while  [[ -f $namefilewithpath ]]
           do
                namefile=$(./creatingNameConditions.sh $(echo $5 | awk -F "." '{print $1}') $4 $(echo $5 | awk -F "." '{print $2}'))
                namefilewithpath="$namewithpath/$namefile"
           done
            checkRootDirectory
            if [[ $? -eq 1 ]]
            then
                exit 1
            fi
            checkAnotherDirectory $1
            if [[ $? -eq 0 ]]
            then
                dd if=/dev/zero of=$namefilewithpath count=$size bs=1 2>/dev/null
                echo "--$namefilewithpath was created $(date "+%d-%m-%y %H:%M:%S") size = $size" >> result.log
            else
                exit 1
            fi
        done
    done
fi