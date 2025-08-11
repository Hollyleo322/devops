#!/bin/bash

read -p "Enter the path to the log file "
awk '{if ($7 >= 400 && $7 <= 503) print $0}' $REPLY | goaccess --log-format=COMBINED