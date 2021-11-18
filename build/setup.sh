#!/bin/bash

echo "Install packages"
sudo yum -y install httpd
sudo yum install python3 -y
su - ec2-user
pip3 install boto3 
pip3 install flask 

echo "Start httpd"
service httpd start
chkconfig httpd on

echo "Copy files"
sudo mkdir -p /var/www/html/templates
sudo cp /tmp/index.html /var/www/html/templates/index.html
sudo cp /tmp/application.py /var/www/html/application.py