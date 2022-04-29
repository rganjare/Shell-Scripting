USER_ID=$(sudo id -u)

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[33m You should run script with root user \e[0m"
    exit 1
fi

APP_USER=roboshop

StatusCheck(){
if [ $1 -eq 0 ]; then
    echo -e "\e[32m ====> SUCCESS\e[0m"
else
    echo -e "\e[31m ====> Failuer !!! \e[0m" 
    exit $1
fi
}

Print(){
    echo -e "\e[33m*********************** $1 ***********************\e[0m" &>> $LOG_FILE
    echo -e "\e[33m ==> $1 \e[0m"
}

LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE