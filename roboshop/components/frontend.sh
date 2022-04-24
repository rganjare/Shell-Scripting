
echo "==> Welcome to FrontEnd Component !!!"

USER_ID=$(sudo id -u)

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[33m You should run script with root user \e[0m"
    exit 1
fi

StatusCheck(){
if [ $2 -eq 0 ]; then
    echo $1
    echo -e "\e[32m ==> SUCCESS\e[0m"
else
    echo $1
    echo -e "\e[31m ==> Failuer !!! \e[0m" 
    exit 2
fi
}

echo -e "\e[33m Installing Nginx \e[0m"
sudo yum install nginx -y
StatusCheck -e "\e[33m ==> Nginx installation status \e[0m" $?

echo -e "\e[33m Download the HTDOCS content and deploy under the Nginx path \e[0m"
curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zi"
StatusCheck -e "\e[33m ==> Download the HTDOCS content \e[0m" $?

echo -e "\e[33m Deploy in Nginx Default Location \e[0m"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
if [ $? -eq 0 ]; then
    echo -e "\e[32m==>SUCCESS\e[0m"
else
   echo -e "\e[31m==>Failuer !!!\e[0m" 
   exit 2
fi

echo -e "\e[33m Finally restart the service once to effect the changes \e[0m"
systemctl restart nginx
if [ $? -eq 0 ]; then
    echo -e "\e[32m==>SUCCESS\e[0m"
else
   echo -e "\e[31m==>Failuer !!!\e[0m" 
   exit 2
fi

echo -e "\e[33m Enable Nginx service \e[0m"
systemctl enable nginx
if [ $? -eq 0 ]; then
    echo -e "\e[32m==>SUCCESS\e[0m"
else
   echo -e "\e[31m==>Failuer !!!\e[0m" 
   exit 2   
fi

systemctl status nginx -l