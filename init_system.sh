#!/bin/bash

#adding keys
sudo rpm --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

#adding repos
sudo zypper addrepo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper addrepo https://packages.microsoft.com/yumrepos/edge microsoft-edge-stable
sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:Leap:15.3:NonFree:Update/standard/openSUSE:Leap:15.3:NonFree:Update.repo
sudo zypper addrepo https://download.videolan.org/pub/vlc/SuSE/SLEap_15.3/ VLC
sudo zypper addrepo https://download.nvidia.com/opensuse/leap/15.4 NVIDIA
sudo zypper addrepo https://download.opensuse.org/repositories/server:/database/openSUSE_Leap_15.4/server:database.repo

sudo zypper refresh

#installing
sudo zypper install -y sublime-text
sudo zypper install -y code
sudo zypper install -y microsoft-edge-stable
sudo zypper install -y docker python3-docker-compose
sudo zypper install -y steam
sudo zypper install -y vlc vlc-codecs
sudo zypper install -y --auto-agree-with-licenses x11-video-nvidiaG05 nvidia-glG05 suse-prime
sudo zypper install -y kio-gdrive
sudo zypper install -y java-11-openjdk-devel
sudo zypper install -y mongodb
sudo pip3 install avell-unofficial-control-center

sudo zypper update -y

#docker setup
sudo usermod -G docker -a $USER
sudo systemctl enable docker

#vlc setup
sudo zypper dup --from VLC --allow-vendor-change

#nvidia setup
sudo prime-select nvidia
