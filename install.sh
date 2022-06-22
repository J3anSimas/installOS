#!/bin/bash

cd ~
sudo apt update -qq
sudo apt upgrade -yy 
sudo apt update -qq
sudo apt upgrade -yy
sudo ubuntu-drivers install

sudo remove --purge libreoffice-common

sudo apt install virtualbox virtualbox-ext-pack gdebi nodejs vlc zsh curl cargo npm pip git -yy

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
cargo install exa bat
sudo npm i -global yarn
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb 
sudo gdebi -n ~/Downloads/nvim-linux64.deb
rm -rf ~/Downloads/nvim-linux64.deb

git clone https://github.com/LunarVim/LunarVim
cd LunarVim
bash ./utils/installer/install.sh -y

cd ~/Documents
git clone https://github.com/j3ansimas/dotfiles
chmod +x dotfiles/install.sh
sh install.sh

cd /home/jeans/Downloads
wget http://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n ~/Downloads/google-chrome-stable_current_amd64.deb
rm -rf ~/Downloads/google-chrome-stable_current_amd64.deb

wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
sudo tar -xvf ~/Downloads/go1.18.3.linux-amd64.tar.gz -C /usr/local
rm -rf ~/Downloads/go1.18.3.linux-amd64.tar.gz

git config --global user.email "jeansimas16@gmail.com"
git config --global user.name "Jean Simas"
sudo apt install gh
gh auth login -p https -w

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
reboot

