#!/bin/bash

#adding keys
sudo rpm --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

#adding repos
sudo zypper addrepo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper addrepo https://packages.microsoft.com/yumrepos/edge microsoft-edge-beta
sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:Leap:15.3:NonFree:Update/standard/openSUSE:Leap:15.3:NonFree:Update.repo
sudo zypper addrepo -cfp 90 -n VLC http://download.videolan.org/pub/vlc/SuSE/Tumbleweed/ vlc
sudo zypper addrepo https://download.nvidia.com/opensuse/tumbleweed NVIDIA

sudo zypper refresh -y

#installing
sudo zypper install -y sublime-text
sudo zypper install -y code
sudo zypper install -y microsoft-edge-beta
sudo zypper install -y docker python3-docker-compose
sudo zypper install -y steam
sudo zypper install -y vlc vlc-codecs
sudo zypper install -y x11-video-nvidiaG05
sudo zypper install -y nvidia-glG05
sudo pip3 install avell-unofficial-control-center

sudo zypper update -y

#docker setup
sudo usermod -G docker -a $USER
sudo systemctl enable docker

#vlc setup
sudo zypper dup --from vlc --allow-vendor-change

#nvidia setup
sudo prime-select nvidia