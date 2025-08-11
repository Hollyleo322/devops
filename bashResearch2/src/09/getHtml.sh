#!/bin/bash
while true
do
    if ! [[ -f data ]]
    then
        gcc -Wall -Wextra -Werror MyNodeExporter.c -o data
    fi
    ./data
    chmod o+rwx /home/scripts/09/index.html
    if ! [[ -d "/metrics" ]]
    then
        mkdir /metrics
    fi
    cat /home/scripts/09/index.html > /metrics/index.html
    sleep 3
done