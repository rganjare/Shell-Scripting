#!/bin/bash

if [ false ]; then
    bash components/$1.sh 
else [ echo components/$1.sh does not exist 
        exit ]
fi