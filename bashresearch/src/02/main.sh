#!/bin/bash

./check.sh $@
if [[ $? -eq 0 ]]
then
    colorsMain=("\033[97m" "\033[91m" "\033[92m" "\033[94m" "\033[35m" "\033[30m")
    colorsBackground=("\033[107m" "\033[101m" "\033[102m" "\033[104m" "\033[45m" "\033[40m")
    colorTextFirst=${colorsMain[$1 - 1]}
    colorBackFirst=${colorsBackground[$2 - 1]}
    colorTextSecond=${colorsMain[$3 - 1]}
    colorBackSecond=${colorsBackground[$4 - 1]}
    source ./paintText.sh
    for (( i=1; i<=15; i++ ))
    do
        paint $colorTextFirst $colorBackFirst "$(./../01/info.sh | awk -v var=$i 'NR==var {print $1}')" $colorTextSecond $colorBackSecond "$(./../01/info.sh | awk -v var=$i 'NR==var {for (i=3;i<=7;i++) print $i}')"
    done
fi