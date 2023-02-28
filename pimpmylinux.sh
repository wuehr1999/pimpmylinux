#!/bin/bash

ROS_VERSION=humble

sudo apt-get -yq update
sudo apt-get -yq upgrade

sudo apt-get -yq install git vim tmux terminator htop arandr gource wget

git clone https://github.com/wuehr1999/vimrc.git
cd vimrc
./setup.sh
cd ..

sudo apt-get -yq install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install -yq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

locale  # check for UTF-8
sudo apt update && sudo apt install -yq locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings

sudo apt install -yq software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install -yq curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt -yq upgrade
sudo apt install -yq ros-$ROS_VERSION-desktop

sudo apt-get install -yq gparted
sudo apt-get install -yq cutecom minicom

sudo apt-get install -yq freecad

sudo add-apt-repository ppa:kicad/kicad-7.0-releases
sudo apt install -yq kicad

curl https://updates.signal.org/desktop/apt/keys.asc | sudo -H gpg --dearmor -o /etc/apt/keyrings/signal-desktop-archive.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/signal-desktop-archive.gpg] https://updates.signal.org/desktop/apt xenial main" | sudo tee /etc/apt/sources.list.d/signal-desktop-xenial.list
sudo apt update && sudo apt install -yq signal-desktop 

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -yq spotify-client

sudo usermod -a -G dialout $USER

sudo apt install -yq texlive-full texstudio
