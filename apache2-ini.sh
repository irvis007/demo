#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sydo systemctl start apache2
sudo bash -c 'echo your very first web server > /var/www/html/index.html'
