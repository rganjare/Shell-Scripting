
echo "==> Welcome to FrontEnd Component !!!"

echo "\e[33m Installing Nginx \e[0m"
yum install nginx -y

echo "\e[33 download the HTDOCS content and deploy under the Nginx path \e[0m"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

echo "/e[33 Deploy in Nginx Default Location \e[0m"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

echo "/e[33m Finally restart the service once to effect the changes /e[0m"
systemctl restart nginx
systemctl enable nginx