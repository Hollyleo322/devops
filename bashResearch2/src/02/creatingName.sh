#!/bin/bash

function addLetter()
{
    name=$1
    for (( i=0; i<1+$RANDOM % ($2 + 10); i++ ))
    do
        name+=$(echo $3)
    done
    echo "$name"
}
function createNameOneletter
{
    for (( i=0; i<5+$RANDOM % ($2 + 4); i++ ))
    do 
        name+=$1
    done
    echo "$name"
}

function createNameTwoletters
{
for (( i=0; i<4; i++ ))
do
    name+=$(echo $1 | cut -c 1)
done
name=$(addLetter $name $2 $(echo $1 | cut -c 2))
echo "$name"
}
function createNameThreeletters
{
    for (( i=0; i<3; i++ ))
    do
        name+=$(echo $1 | cut -c 1)
    done
    length=$(( $2 / 2 ))
    name=$(addLetter $name $length $(echo $1 | cut -c 2))
    name=$(addLetter $name $length $(echo $1 | cut -c 3))
    echo "$name"
}

function createNameFourletters
{
    for (( i=0; i<2; i++ ))
    do
        name+=$(echo $1 | cut -c 1)
    done
    length=$(( $2 / 3 ))
    name=$(addLetter $name $length $(echo $1 | cut -c 2))
    name=$(addLetter $name $length $(echo $1 | cut -c 3))
    name=$(addLetter $name $length $(echo $1 | cut -c 4))
    echo "$name"
}
function createNameFiveletters
{
    for (( i=0; i<1; i++ ))
    do
        name+=$(echo $1 | cut -c 1)
    done
    length=$(( $2 / 4 ))
    name=$(addLetter $name $length $(echo $1 | cut -c 2))
    name=$(addLetter $name $length $(echo $1 | cut -c 3))
    name=$(addLetter $name $length $(echo $1 | cut -c 4))
    name=$(addLetter $name $length $(echo $1 | cut -c 5))
    echo "$name"
}
function createNameSixletters
{
    for (( i=0; i<1; i++ ))
    do
        name+=$(echo $1 | cut -c 1)
    done
    length=$(( $2 / 5 ))
    name=$(addLetter $name $length $(echo $1 | cut -c 2))
    name=$(addLetter $name $length $(echo $1 | cut -c 3))
    name=$(addLetter $name $length $(echo $1 | cut -c 4))
    name=$(addLetter $name $length $(echo $1 | cut -c 5))
    name=$(addLetter $name $length $(echo $1 | cut -c 6))
    echo "$name"
}
function createNameSevenletters
{
    for (( i=0; i<1; i++ ))
    do
        name+=$(echo $1 | cut -c 1)
    done
    length=$(( $2 / 6 ))
    name=$(addLetter $name $length $(echo $1 | cut -c 2))
    name=$(addLetter $name $length $(echo $1 | cut -c 3))
    name=$(addLetter $name $length $(echo $1 | cut -c 4))
    name=$(addLetter $name $length $(echo $1 | cut -c 5))
    name=$(addLetter $name $length $(echo $1 | cut -c 6))
    name=$(addLetter $name $length $(echo $1 | cut -c 7))
    echo "$name"
}