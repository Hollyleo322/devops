#!/bin/bash

gcc -Wall -Wextra -Werror MyNodeExporter.c -o data
./data
chmod o+rwx /home/scripts/09/index.html
if ! [[ -d "/metrics" ]]
then
    mkdir /metrics
fi
cat /home/scripts/09/index.html > /metrics/index.html
echo "*/1 * * * * /home/scripts/09/getHtmlThrueCron.sh" > rules.cron
crontab rules.cron