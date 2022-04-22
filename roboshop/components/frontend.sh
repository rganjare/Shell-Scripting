
echo "==> Welcome to FrontEnd Component !!!"

USER_ID=$(id -u)

echo "$USER_ID"

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[33m You should run script with root user \e[0m"
    exit 1
fi

echo -e "\e[33m Installing Nginx \e[0m"
yum install nginx -y

echo -e "\e[33m download the HTDOCS content and deploy under the Nginx path \e[0m"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

echo -e "\e[33m Deploy in Nginx Default Location \e[0m"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[33m Finally restart the service once to effect the changes \e[0m"
systemctl restart nginx
systemctl enable nginx