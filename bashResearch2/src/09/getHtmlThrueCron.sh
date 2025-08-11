#!/bin/bash
for i in {1..20}
do
    /home/scripts/09/data
    if ! [[ -d "/metrics" ]]
    then
        mkdir /metrics
    fi
    cat /home/scripts/09/index.html > /metrics/index.html
    sleep 3
done
