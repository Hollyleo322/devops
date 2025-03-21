#!/bin/bash

hm=$(date +%Z)
hr=$(($hm * 1))
echo "HOSTNAME =" $HOSTNAME
echo "TIMEZONE =" $(cat /etc/timezone) UTC $(printf "%+d" $hr)
echo "USER =" $USER
echo "OS =" $(cat /etc/issue | cut -d" " -f1-3)
echo "DATE =" $(date "+%e %B %Y %X")
echo "UPTIME =" $(uptime -p)
echo "UPTIME_SEC =" $(cat /proc/uptime | cut -d"." -f1) seconds
echo "IP =" $(hostname -I)
mask=$(ip -o -f inet addr show | grep "scope global" | awk '{print $4}')
echo "GATEWAY =" $(ipcalc $mask | grep Netmask | awk '{print $2}')
source ./getlvlup.sh
ramTotalmg=$(free --mega | awk '/^Mem:/{print $2}')
ramTotalgb=$(getlvlup $ramTotalmg)    
echo "RAM_TOTAL =" $(printf %.3f $ramTotalgb) GB
ramUsedmg=$(free --mega | awk '/^Mem:/{print $3}')
ramUsedgb=$(getlvlup $ramUsedmg)
echo "RAM_USED =" $(printf %.3f $ramUsedgb) GB
ramFreemg=$(free --mega | awk '/^Mem:/{print $4}')
ramFreegb=$(getlvlup $ramFreemg)
echo "RAM_FREE =" $(printf %.3f $ramFreegb) GB
spaceRoot=$(df /root | awk 'NR==2 {printf "%.2f\n", $2}')
spaceRootmg=$(getlvlup $spaceRoot)
echo "SPACE_ROOT =" $(printf %.2f $spaceRootmg) MB
spaceRootUsed=$(df /root | awk 'NR==2 {printf "%.2f\n", $3}')
spaceRootUsedmg=$(getlvlup $spaceRootUsed)
echo "SPACE_ROOT_USED =" $(printf %.2f $spaceRootUsedmg) MB
spaceRootFree=$(df /root | awk 'NR==2 {printf "%.2f\n", $4}')
spaceRootFreemg=$(getlvlup $spaceRootFree)
echo "SPACE_ROOT_FREE =" $(printf %.2f $spaceRootFreemg) MB