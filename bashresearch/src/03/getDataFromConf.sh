#!/bin/bash

function getData()
{
    grep -oG ^$1=. *.conf | awk -F "=" '{print $2}'
}