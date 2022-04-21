#!/bin/bash

# User input Variables
read -p "==> Enter your Name: " NAME
echo ==> my name is $NAME
echo "==> my name is $NAME"


##Special Variables
## $0-$n, $*, $@, $#.
#  $0 - Script Name
#  $1 - $n - Arguments parsed in the order.
#  $* , $@ - All arguments 
#  $# - Number of arguments

echo script Name         $0
echo first argument      $1
echo second argument     $2
echo all arguments       $@
echo all arguments       $*
echo number of Arguments $#

