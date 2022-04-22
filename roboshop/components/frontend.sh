
echo "==> Welcome to FrontEnd Component !!!"

USER_ID=$(sudo id -u)

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[33m You should run script with root user \e[0m"
    exit 1
fi

echo -e "\e[33m Installing Nginx \e[0m"
yum install nginx -y
if [ $? -eq 0 ]; then
    echo -e "\e[32m==>SUCCESS\e[0m"
else
   echo -e "\e[31m==>Failuer\e[0m" 
fi

echo -e "\e[33m download the HTDOCS content and deploy under the Nginx path \e[0m"
curl -f -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
if [ $? -eq 0 ]; then
    echo -e "\e[32m==>SUCCESS\e[0m"
else
   echo -e "\e[31m==>Failuer\e[0m" 
fi

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
   echo -e "\e[31m==>Failuer\e[0m" 
fi

echo -e "\e[33m Finally restart the service once to effect the changes \e[0m"
systemctl restart nginx
if [ $? -eq 0 ]; then
    echo -e "\e[32m==>SUCCESS\e[0m"
else
   echo -e "\e[31m==>Failuer\e[0m" 
fi
systemctl enable nginx