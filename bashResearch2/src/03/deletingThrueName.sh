#!/bin/bash

find / -name $1 >> deletedthrueNames.log
awk '$1' deletedthrueNames.log | xargs rm -rf

find / -name "$1.*" >> deletedthrueNames.log
awk '$1' deletedthrueNames.log | xargs rm -rf