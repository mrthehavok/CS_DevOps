#!/bin/bash

echo "Enable autostart"
cp /tmp/web_flask.service /etc/systemd/system/web_flask.service
cp /tmp/application.py /home/ec2-user/web_flask/application.py
cp /tmp/index.html /home/ec2-user/web_flask/templates/index.html
systemctl start web_flask
systemctl status web_flasksystemctl enable web_flask
