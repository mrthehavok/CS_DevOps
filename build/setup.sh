#!/bin/bash

echo "Enable autostart"
cp /tmp/web_flask.service /etc/systemd/system/web_flask/web_flask.service
cp /tmp/application.py /home/ec2-user/web_flask/application.py
cp /tmp/index.html /home/ec2-user/web_flask/templates/index.html
systemctl enable web_flask