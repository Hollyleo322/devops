#!/bin/bash

end=$(date "+%s %N" | awk '{printf "%d.%d", $1,$2 / 10000000}')
result=$(echo $end - $1 | bc)
if [[ $result =~ ^\. ]]
then
    result=$(echo 0$result)
fi
echo "Script execution time (in seconds) = $result"
echo "Script execution time (in seconds) = $result" >> result.log