#!/bin/bash
now=$(date "+%s %N" | awk '{printf "%d.%d", $1, $2 / 10000000}')
./check.sh $@
if [[ $? -eq 0 ]] 
then
    echo "Total number of folders (including all nested ones) =  $(ls -lR $1 2>/dev/null | grep "^d" | wc -l)"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    ./sizeDir.sh $1 | awk '{printf "%d - %s, %s %sB\n",NR,$2,substr($1,0,length($1) - 1), substr($1, length($1))}'
    echo "Total number of files = $(ls -lR $1 2>/dev/null | grep ^- | wc -l)"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $(ls -lR $1 2>/dev/null | grep ^- | grep conf$ | wc -l)"
    echo "Text files =" $(ls -lR $1 2>/dev/null | grep ^- | grep txt$ | wc -l)
    echo "Executable files =" $(ls -lR $1 2>/dev/null | grep ^- | grep exe$ | wc -l)
    echo "Log files (with the .log extension) =" $(ls -lR $1 2>/dev/null | grep ^- | grep log$ | wc -l)
    echo "Archive files =" $(ls -lR $1 2>/dev/null | grep ^- | grep -e gz$ -e zip$ -e rar$ -e bz2$ -e tar$ | wc -l)
    echo "Symbolic links =" $(ls -lR $1 2>/dev/null | grep ^l | wc -l)
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    ./sizeFile.sh $1 | awk 'array[1] = 2{printf "%d - %s, %s %sB, %s\n",NR,$2,substr($1,0,length($1) - 1),substr($1, length($1)), array[split($2,array,".")]}'
    echo "TOP 10 executable files of maximum size arranged in descending order (path, size and hash):"
    ./sizeExe.sh $1 | awk '{printf "%d - %s, %s %sB, %s\n",NR,$1,substr($2,0,length($1) - 1),substr($2, length($1)), $3}'
    end=$(date "+%s %N" | awk '{printf "%d.%d", $1,$2 / 10000000}')
    result=$(echo $end - $now | bc)
    if [[ $result =~ ^. ]]
    then
        result=$(echo 0$result)
    fi
    echo "Script execution time (in seconds) = $result"
fi