#!/bin/bash

echo -e "\e[33m ===> Welcome to MongoDB component installation & configuration !!! \e[0m"

source components/common.sh

Print "Setup MongoDB repos"
curl -f -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE
StatusCheck $? 

Print "Install MongoDB" 
yum install -y mongodb-org &>>$LOG_FILE  
StatusCheck $?  

Print "Update Listen IP address in config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf 
StatusCheck $? 

Print "Start MongoDB" 
systemctl enable mongod &>>$LOG_FILE && systemctl start mongod &>>$LOG_FILE
StatusCheck $? 

Print "Download the schema"
curl -f -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG_FILE
StatusCheck $? 

# -f ==> if download fails, it will return exit code other than 0
# -o ==> it will overwrite the existing folder

Print "Unzip the repo"
cd /tmp &>>$LOG_FILE && unzip -o mongodb.zip &>>$LOG_FILE 
StatusCheck $? 

Print "Load the schema"
cd mongodb-main &>>$LOG_FILE && mongo < catalogue.js &>>$LOG_FILE && mongo < users.js &>>$LOG_FILE
StatusCheck $? 