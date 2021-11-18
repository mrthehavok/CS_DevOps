#!/bin/bash
echo "Configure autostart flask"
mkdir -p /etc/systemd/system/web_flask

echo "Install packages"
yum install python3 -y
su - ec2-user
pip3 install boto3 
pip3 install flask 
mkdir -p /home/ec2-user/web_flask/templates