#!/bin/bash

# Check if script is run as root directly
if [[ $EUID -ne 0 ]]; then
    echo "Script must be run with root privileges!" >&2
    exit 1
fi

apt update
apt install ruby build-essential ruby-dev ruby-full ruby-bundler -y

sudo -u $SUDO_USER echo "gem: --user-install" >> ~/.gemrc
sudo -u $SUDO_USER gem install jekyll
sudo -u $SUDO_USER gem install bundler