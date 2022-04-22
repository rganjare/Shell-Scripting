#!/bin/bash

if [ true ]; then
    bash components/$1.sh 
else [ echo components/$1.sh does not exist 
        exit ]
fi