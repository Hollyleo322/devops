#!/bin/bash
now=$(date "+%s %N" | awk '{printf "%d.%d", $1, $2 / 10000000}')
source ./checkAvailaibleSpace.sh
./check.sh $@
if [[ $? -eq 0 ]]
then
    length=100
    size="$(echo $3 | grep -oP '\d+')M"
    for dir in /*
    do
        if [[ $dir =~ [bin]+$ || $dir =~ [sbin]+$  ]]
        then
            continue;
        fi
        for i in $(seq 1 $length)
        do
            name=$(./creatingNameConditions.sh $1 $length)
            namewithpath="$dir/$name"
            while  [[ -d "$namewithpath" ]]
            do
                name=$(./creatingNameConditions.sh $1 $length)
                namewithpath="$dir/$name"
            done
            checkRootDirectory
            if [[ $? -eq 1 ]]
            then
                ./writeTime.sh $now
                exit 1
            fi
            checkAnotherDirectory $dir $3
            if [[ $? -eq 0 ]]
            then
                mkdir "$namewithpath"
                echo "$namewithpath was created $(date "+%d-%m-%y %H:%M:%S")" >> result.log
            else
                break;
            fi
                countFiles=$(( $RANDOM % 100 ))
                for j in $(seq 1 $countFiles )
                do
                    namefile=$(./creatingNameConditions.sh $(echo $2 | awk -F "." '{print $1}') $countFiles $(echo $2 | awk -F "." '{print $2}'))
                    namefilewithpath="$namewithpath/$namefile"
                    while  [[ -f $namefilewithpath ]]
                    do
                            namefile=$(./creatingNameConditions.sh $(echo $2 | awk -F "." '{print $1}') $countFiles $(echo $2 | awk -F "." '{print $2}'))
                            namefilewithpath="$namewithpath/$namefile"
                    done
                checkRootDirectory
                if [[ $? -eq 1 ]]
                then
                    ./writeTime.sh $now
                    exit 1
                fi
                checkAnotherDirectory $namewithpath $3
                if [[ $? -eq 0 ]]
                then
                    dd if=/dev/zero of=$namefilewithpath count=$size bs=1 2>/dev/null
                    echo "--$namefilewithpath was created $(date "+%d-%m-%y %H:%M:%S") size = $size" >> result.log
                else
                    break;
                fi
                done
        done
    done
fi