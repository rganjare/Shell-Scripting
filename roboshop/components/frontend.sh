
echo "==> Welcome to FrontEnd Component !!!"

USER_ID=$(sudo id -u)

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[33m You should run script with root user \e[0m"
    exit 1
fi

StatusCheck(){
if [ $1 -eq 0 ]; then
    echo -e "\e[32m ==> $2 status is => SUCCESS\e[0m"
else
    echo -e "\e[31m ==> $2 status is => Failuer !!! \e[0m" 
    exit $1
fi
}

Print(){
echo -e "\e[33m ==> $1 \e[0m"
}

Print "Installing Nginx"
sudo yum install nginx -y
StatusCheck $? "Nginx installation" 

Print "Download the HTDOCS content"
curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
StatusCheck $? "Download the HTDOCS content" 

Print "Clean up old Nginx content"
cd /usr/share/nginx/html
rm -rf *

Print "Extracting Archive"
unzip /tmp/frontend.zip && mv frontend-main/* . && mv static/* . 
StatusCheck $?

mv localhost.conf /etc/nginx/default.d/roboshop.conf
StatusCheck $? "Deploy in Nginx Default Location status" 

Print "Finally restart the service to effect the changes"
systemctl restart nginx
StatusCheck $? "Restart service status" 

Print "Enable Nginx service"
systemctl enable nginx
StatusCheck $? "Enable Nginx service status" 

systemctl status nginx -l
echo -e "\e[31m Cool!!! Frontend is up and Running !!! \e[0m"