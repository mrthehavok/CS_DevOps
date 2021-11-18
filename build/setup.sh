#!/bin/bash

echo "Enable autostart"
sudo cp /tmp/web_flask.service /etc/systemd/system/web_flask/web_flask.service
sudo systemctl enable web_flask