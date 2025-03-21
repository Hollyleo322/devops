#!/bin/bash

find $1 -type f -name *.exe -exec du -h {} + 2>/dev/null | awk '{ cmd = "md5sum " $2; cmd | getline md5; close(cmd); print $2, $1, md5 }' | sort -hr | head -n 10