#!/bin/bash
for file in $(find / -regex '.*/[a-zA-Z]+_[0-9]+.[a-zA-Z]+$')
do
    inode=$(ls -i $file | awk '{print $1}')
    fileSystem=$(df $file | awk 'NR== 2{print $1}')
    timeOfCreation=$(debugfs -R "stat <$inode>" $fileSystem | grep crtime | awk '{printf "%s %s %s %s %s",$4,$5,$6,substr($7, 0, 5),$8}')
    if [[ $(date -d "$timeOfCreation" +%s) -ge $(date -d "$1" +%s) && $(date -d "$timeOfCreation" +%s) -le $(date -d "$2" +%s) ]]
    then
        echo "$file $timeOfCreation $1 $2" >> date.log
        rm -rf $file
    fi
done