#!/bin/bash

if [-e components/$1.sh ]; then
    bash components/$1.sh 
else [
    echo components/$1.sh does not exist 
    exit
    ]
fi