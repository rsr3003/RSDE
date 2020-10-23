#! /bin/bash

echo -e "Downloading the prerequisite packages for RSDE..." &&
sudo apt install git gnome-flashback gnome-tweaks indicator-application gnome-screensaver -y &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "Adding the Regolith Linux PPA... As we're gonna use this PPA to install i3-gaps, compton, rofi etc." &&
sudo add-apt-repository ppa:regolith-linux/release &&
echo -e "\n..................................PPA Added.....................................\n\n" &&
echo -e "Now downloading i3 related packages..." &&
sudo apt install i3-gaps rofi compton fonts-source-code-pro-ttf -y && sudo apt purge --autoremove dunst i3lock i3status -y &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "Now downloading packages related to xfce4 panel..." &&
sudo apt install xfce4-panel xfce4-whiskermenu-plugin xfce4-notifyd xfce4-power-manager-plugins xfce4-indicator-plugin -y &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "\nNow setting up all the configuration files....." &&
cp .Xresources-RSDE ~/ && cp compton.conf ~/.config/ && cp -r .rsde ~/ && cp -r RSDE ~/.config/ &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "\nNow setting up RSDE-gnome-flashback....." &&
git clone https://github.com/rsr3003/RSDE-gnome-flashback.git ~/.RSDE-flashback && cd ~/.RSDE-flashback && sudo make install && cd &&
echo -e "\n..................................Done.....................................\n" &&
echo -e "\n...........................RSDE is ready to go.............................\n" &&
echo -e "\n................Now Reboot and select RSDE as your session.................\n"
