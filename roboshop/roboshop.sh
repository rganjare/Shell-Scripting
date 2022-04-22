#!/bin/bash

if [!-e components/$1.sh ];then
echo components/$1.sh does not exist 
exit 
else
bash components/$1.sh
fi