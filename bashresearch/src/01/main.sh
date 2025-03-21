#!/bin/bash

./check.sh $@
if [[ $? -eq 0 ]]
then
    ./info.sh
    read -p "Write the data in a file? (Y/N): "
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        ./info.sh >> $(date +%d_%m_%y_%H_%M_%S.status)
    fi
else
    echo "Script works without parametrs"
fi