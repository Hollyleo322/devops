#!/bin/bash

read -p "Enter the path to the log file "
awk '{
 info[NR] = $0
 code[NR] = $7
 }
 END{
 for (i = 1; i < NR; i++)
 {
    for ( j = i + 1; j <= NR; j++)
    {
        if (code[i] < code[j])
        {
            tempcode = code[i]
            code[i] = code[j]
            code[j] = tempcode

            temp = info[i]
            info[i] = info[j]
            info[j] = temp
        }
    }
 }
 for (i = 1; i <= NR; i++)
 {
    print info[i]
 }
 }
 ' $REPLY