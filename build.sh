#!/bin/bash

# Update / Upgrade System
sudo apt update -y
sudo apt upgrade -y

# Install Packages and Configure Firefox for CAC Authentication
sudo apt install -y libpcsclite1 pcscd pcsc-tools cackey
firefox &
clear
echo "Please wait for 10 seconds..."
sleep 10s
pkill -f firefox
clear
echo "Please wait for 10 more seconds..."
sleep 10s
pkcs11-register
clear

# Install Discord Desktop
echo "Installing Discord"
wget https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.deb
sudo apt install -y ./discord-0.0.17.deb
sudo rm discord-0.0.17.deb

# Install Signal Desktop
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update -y && sudo apt install -y signal-desktop
sudo rm signal-desktop-keyring.gpg
cd ..
sudo rm -rf CS23-LiveBuilder

clear
echo "All done. Please submit a ticket if you have issues or want a feature added."
echo "https://github.com/EvalGenie/CS23-LiveBuilder/issues."
