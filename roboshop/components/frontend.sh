
echo "==> Welcome to FrontEnd Component !!!"

USER_ID=$(sudo id -u)

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[33m You should run script with root user \e[0m"
    exit 1
fi

StatusCheck(){
if [ $1 -eq 0 ]; then
    echo -e "\e[32m ==> $2 is => SUCCESS\e[0m"
else
    echo -e "\e[31m ==> $2 is => Failuer !!! \e[0m" 
    exit $1
fi
}

echo -e "\e[33m ==> Installing Nginx \e[0m"
sudo yum install nginx -y
StatusCheck $? "Nginx installation status" 

echo -e "\e[33m Download the HTDOCS content and deploy under the Nginx path \e[0m"
curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
StatusCheck $? "Download the HTDOCS content status" 

echo -e "\e[33m Deploy in Nginx Default Location \e[0m"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
StatusCheck $? "Deploy in Nginx Default Location status" 

echo -e "\e[33m Finally restart the service once to effect the changes \e[0m"
systemctl restart nginx
StatusCheck $? "Restart service status" 

echo -e "\e[33m Enable Nginx service \e[0m"
systemctl enable nginx
StatusCheck $? "Enable Nginx service status" 

systemctl status nginx -l