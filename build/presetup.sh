#!/bin/bash

echo "Install packages"
yum install python3 -ypip3 install boto3
pip3 install flask
mkdir -p /home/ec2-user/web_flask/templates
