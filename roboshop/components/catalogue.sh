#!/bin/bash

echo -e "/e[33m ===> Welcome to Catalogue component /e[0m"

source /components/common.sh

Print "Download package"
curl -f -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$LOG_FILE
StatusCheck $?

Print "Install NodeJS"
yum install nodejs gcc-c++ -y &>>$LOG_FILE
StatusCheck $?

Print "Add Application user"
id ${APP_USER} &>>$LOG_FILE 
if [ $? -ne 0 ]; then
useradd ${APP_USER} &>>$LOG_FILE 
fi
StatusCheck $?

Print "Download the Catalogue repo"
curl -f -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG_FILE
StatusCheck $?

Print "Unzip & move catalogue repo"
cd /home/${APP_USER} &>>$LOG_FILE && unzip -o /tmp/catalogue.zip &>>$LOG_FILE && mv catalogue-main catalogue &>>$LOG_FILE 
StatusCheck $?

Print "Install app Dependencies"
cd /home/${APP_USER}/catalogue &>>$LOG_FILE && npm install &>>$LOG_FILE
StatusCheck $?

Print "Set App user permissions"
chown -R ${APP_USER}:${APP_USER} /home/${APP_USER}
StatusCheck $?


 