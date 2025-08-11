#!/bin/bash

read -p "Enter the path to the log file "
awk '
{uniqueIp[$1] = $0}
END{
for(ip in uniqueIp){
print uniqueIp[ip]
}
}
' $REPLY