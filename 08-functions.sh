#!/bin/bash

# Variable : If we assign a name to set of data that is variable
# Function : If we assign a name to set of commands that is function

# func_name() {
# commands
# commands
# }

# func_name

## Declare a function

PrintMessage(){
echo My name is Rahul.
echo I am learning $1.
echo I am very keen about it.
echo I want to get $a lacs of package
b=20
}

a=20

echo -e "\e[33m ===> I am running PrintMessage function. \e[0m"
PrintMessage Selenium



echo -e "\e[33m ===> I am running main program. \e[0m"
echo I want to get $1 lacs of package
echo I want salary revision upto $b lacs in same company
b=30
echo The OverWritten revised salary upto $b lacs in same company

STAT(){
    echo Hello
    return 1
}

STAT
echo -e "\e[32m ===> Exit status of function STAT is \e[0m" $?

## Note, Function needs to declared first and then you call the function later in the code
## Function will have it's own set of special variables
## Variable declared in main program can be overwritten in function and vice versa.
# Function is a command , Function have exit status well