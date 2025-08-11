#!/bin/bash

function rewriteDate {
    date=$(echo $1 | awk -F "-" '{print $1}')
    time=$(echo $1 | awk -F "-" '{print $2}')
    day=$(echo $date | awk -F "." '{print $1}')
    month=$(echo $date | awk -F "." '{print $2}')
    year=$(echo $date | awk -F "." '{print $3}')
    hour=$(echo $time | awk -F ":" '{print $1}')
    minutes=$(echo $time | awk -F ":" '{print $2}')
    echo "$month/$day/$year $hour:$minutes"
}