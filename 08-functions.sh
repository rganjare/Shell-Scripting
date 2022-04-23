#!/bin/bash

PrintMessage(){
echo My name is Rahul.
echo I am learning $1.
echo I am very keen about it.
echo I want to get $a lacs of package
b=20
}

a=20
echo -e "\e[33m ===> I am running PrintMessage function \e[0m"
PrintMessage Selenium

echo -e "\e[33m ===> I am running main program \e[0m"
echo I want to get $1 lacs of package
echo I want salary revision upto $b lacs in same company

STAT(){
    echo Hello
    return 1
}

STAT
echo Exit status of function STAT is $?