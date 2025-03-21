#!/bin/bash

function getlvlup {
    echo $1/1024 | bc -l
}