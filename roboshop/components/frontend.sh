
echo -e "\e[34m ***** Welcome to FrontEnd Component installation ****\e[0m"

source components/common.sh 

Print "Installing Nginx"
sudo yum install nginx -y &>>$LOG_FILE
StatusCheck $? 

Print "Download the HTDOCS content"
curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>> $LOG_FILE
StatusCheck $? 

Print "Clean up old Nginx content"
cd /usr/share/nginx/html
rm -rf *
StatusCheck $? 

Print "Extracting Archive"
unzip /tmp/frontend.zip &>>$LOG_FILE && mv frontend-main/* . &>>$LOG_FILE && mv static/* . &>>$LOG_FILE
StatusCheck $? 

Print "Updating RoboShop configuration"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
StatusCheck $? 

Print "Starting Nginx"
systemctl restart nginx && systemctl enable nginx &>>$LOG_FILE
StatusCheck $? 

Print "Frontend Application status check"
systemctl status nginx -l &>>$LOG_FILE
if [ $? -eq 0 ]; then
echo -e "\e[32m Cool!!! Frontend is up and Running !!! \e[0m"
fi