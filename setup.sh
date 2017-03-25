#!/bin/sh

echo '\n==== ==== ==== Apache2 ==== ==== ====\n'
apt-get update
apt-get -y install apache2 systemd
ufw deny "Apache Full"
service apache2 stop

echo '\n==== ==== ====  mariaDB ==== ==== ====\n'
apt-get -y install mariadb-server mariadb-client

echo '\n==== ==== ==== PHP 7.1 ==== ==== ====\n'
apt-add-repository -y ppa:ondrej/php
apt-get update
apt-get -y install php7.1 libapache2-mod-php7.1 php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc

echo '\n==== ==== ==== nginx ==== ==== ====\n'
apt-get -y install nginx
ufw allow "Nginx Full"

echo '\n==== ==== ==== git & curl ==== ==== ====\n'
apt-get -y install git curl

echo '\n==== ==== ==== nodejs ==== ==== ====\n'
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get -y install nodejs
npm install -g yarn

echo '\n==== ==== ==== autoremove ==== ==== ====\n'
apt-get -y autoremove

echo '\n==== Secure mariaDB\n'
mysql_secure_installation

echo '\n\n===== DONE! =====\n\n'

