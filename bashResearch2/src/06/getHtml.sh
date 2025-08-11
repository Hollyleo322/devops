#!/bin/bash

read -p "Enter the path to the log file "
goaccess --log-format=COMBINED -o report.html $REPLY