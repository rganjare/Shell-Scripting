#!/bin/bash

echo -e "\e[33m ===> Welcome to MongoDB component installation & configuration !!! \e[0m"

source components/common.sh

Print "Setup MongoDB repos"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
StatusCheck $? "Setup MongoDB repos"

Print "Install MongoDB" 
yum install -y mongodb-org &>>$LOG_FILE  
StatusCheck $? "Install MongoDB" 

Print "Update Listen IP address in config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf 
StatusCheck $? "Update Listen IP address in config file"

Print "Start MongoDB" 
systemctl enable mongod &>>$LOG_FILE && systemctl start mongod &>>$LOG_FILE
StatusCheck $? "Start MongoDB" 

Print "Download the schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG_FILE
StatusCheck $? "Download the schema"

Print "Unzip the repo"
cd /tmp &>>$LOG_FILE && unzip mongodb.zip &>>$LOG_FILE 
StatusCheck $? "Unzip the repo"

Print "Load the schema"
cd mongodb-main &>>$LOG_FILE && mongo < catalogue.js &>>$LOG_FILE && mongo < users.js &>>$LOG_FILE
StatusCheck $? "Load the schema"