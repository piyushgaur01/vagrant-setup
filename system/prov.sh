#!/usr/bin/env bash

# Update
sudo apt-get update

# Install build tools
sudo apt-get install -y build-essential curl

# Add the repositories to install the latest version of nginx
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:nginx/stable
sudo apt-get update

# Download and install pre-compiled NodeJS v12.x.x
cd /tmp && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && sudo apt-get install -y nodejs

# Copy all files from /vagrant to /home/vagrant
cd /vagrant
cp -R * /home/vagrant
cd /home/vagrant && npm install --no-bin-links


# Adding pm2 and configuring it to run on reboot automatically
sudo npm install pm2 -g
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u root --hp /root
sudo chmod 0777 /etc/systemd/system/pm2-vagrant.service
cd /home/vagrant && pm2 startOrRestart ecosystem.config.js && pm2 save
