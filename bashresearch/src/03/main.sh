#!/bin/bash

./check.sh $@

if [[ $? -eq 0 ]] 
then
    colors=("(white)" "(red)" "(green)" "(blue)" "(purple)" "(black)")
    colorsMain=("\033[97m" "\033[91m" "\033[92m" "\033[94m" "\033[35m" "\033[30m")
    colorsBackground=("\033[107m" "\033[101m" "\033[102m" "\033[104m" "\033[45m" "\033[40m")
    source getDataFromConf.sh
    source checkArgument.sh
    source changeIndex.sh
    source ../02/paintText.sh
    indexTF=6
    indexBF=1
    indexTS=2
    indexBS=4
    colorTextFirst=$(getData column1_background)
    colorBackFirst=$(getData column1_font_color)
    colorTextSecond=$(getData column2_background)
    colorBackSecond=$(getData column2_font_color)
    colorTextFirst=$(checkNumber $colorTextFirst)
    colorBackFirst=$(checkNumber $colorBackFirst)
    colorTextSecond=$(checkNumber $colorTextSecond)
    colorBackSecond=$(checkNumber $colorBackSecond)
    indexTF=$(checkIndex $colorTextFirst $indexTF)
    indexBF=$(checkIndex $colorBackFirst $indexBF)
    indexTS=$(checkIndex $colorTextSecond $indexTS)
    indexBS=$(checkIndex $colorBackSecond $indexBS)
    source ./../02/paintText.sh
    for (( i=1; i<=15; i++ ))
    do
        paint "${colorsMain[$indexTF - 1]}" "${colorsBackground[$indexBF - 1]}" "$(./../01/info.sh | awk -v var=$i 'NR==var {print $1}')" "${colorsMain[$indexTS - 1]}" "${colorsBackground[$indexBS - 1]}" "$(./../01/info.sh | awk -v var=$i 'NR==var {for (i=3;i<=7;i++) print $i}')"
    done
    echo " "
    echo "Column 1 background = $colorTextFirst ${colors[$indexTF - 1]}"
    echo "Column 1 font color = $colorBackFirst ${colors[$indexBF - 1]}"
    echo "Column 2 background = $colorTextSecond ${colors[$indexTS - 1]}"
    echo "Column 2 font color = $colorBackSecond ${colors[$indexBS - 1]}"
fi