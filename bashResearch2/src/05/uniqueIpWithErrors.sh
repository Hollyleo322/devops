#!/bin/bash

read -p "Enter the path to the log file "
awk '{info[$1] = $0}
END{
	for (ip in info){
		split(info[ip],line," ")
        if (line[7] >= 400 && line[7] <= 503){
        	print info[ip]
        }
    }
}' $REPLY