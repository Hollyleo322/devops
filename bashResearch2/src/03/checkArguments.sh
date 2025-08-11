#!/bin/bash

function checkDate
{
    date=$(echo $1 | awk -F "-" '{print $1}')
    time=$(echo $1 | awk -F "-" '{print $2}')
    day=$(echo $date | awk -F "." '{print $1}')
    month=$(echo $date | awk -F "." '{print $2}')
    year=$(echo $date | awk -F "." '{print $3}')
    hour=$(echo $time | awk -F ":" '{print $1}')
    minutes=$(echo $time | awk -F ":" '{print $2}')
    day=${day#0}
    month=${month#0}
    year=${year#0}
    hour=${hour#0}
    minutes=${minutes#0}
    if [[ $day -gt 31 || $month -gt 12 || $year -gt 99 || $hour -gt 23 || $minutes -gt 59 || $day -lt 1 || $month -lt 1 || $year -lt 0 || $hour -lt 0 || $minutes -lt 0 ]]
    then
        echo 1
    fi
}

function checkNameofFile
{
    if [[ $1 =~ ^[a-zA-Z]+\_[0-9]+$ ]]
    then
        name=$(echo $1 | awk -F "_" '{print $1}')
        date=$(echo $1 | awk -F "_" '{print $2}')
        sizeName=${#name}
        sizeDate=${#date}
        if [[ $sizeName -lt 4 ]]
        then
            echo "Incorrect size of name must be greater than 4"
            exit 1
        fi
        if [[ $sizeDate -ne 6 ]]
        then
            echo "Incorrect size of date"
            exit 1
        fi
        if ! [[ $name =~ ^[a-zA-Z]+$ ]]
        then
            echo "Name must contains only letters of English"
            exit 1
        fi
        if ! [[ $date =~ ^[0-9]+$ ]]
        then
            echo "Incorrect date need DDMMYY"
            exit 1
        fi
    else
        echo "Incorrect format of name of file must be name_date exampl qwe_010124"
        exit 1
    fi
}