#! /bin/bash

git clone https://github.com/rsr3003/RSDE.git ~/RSDE && cd ~/RSDE
echo -e "Downloading the prerequisite packages for RSDE..." &&
sudo apt update -y && sudo apt upgrade -y &&
sudo apt install git gnome-flashback gnome-tweaks indicator-application gnome-screensaver build-essential -y &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "Adding the Regolith Linux PPA... As we're gonna use this PPA to install i3-gaps, compton, rofi etc." &&
sudo add-apt-repository ppa:regolith-linux/release -y &&
echo -e "\n..................................PPA Added.....................................\n\n" &&
echo -e "Now downloading i3 related packages..." &&
sudo apt install i3-gaps rofi compton fonts-source-code-pro-ttf -y && sudo apt purge --autoremove dunst i3lock i3status -y &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "Now downloading packages related to xfce4 panel..." &&
sudo apt install xfce4-panel xfce4-whiskermenu-plugin xfce4-notifyd xfce4-power-manager-plugins xfce4-indicator-plugin -y &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "\nNow setting up all the configuration files....." && mkdir ~/.config &&
cp .Xresources-RSDE ~/ && cp compton.conf ~/.config/ && cp -r .rsde ~/ && cp -r RSDE ~/.config/ &&
echo -e "\n..................................Done.....................................\n\n" &&
echo -e "\nNow setting up RSDE-gnome-flashback....." &&
git clone https://github.com/rsr3003/RSDE-gnome-flashback.git ~/.RSDE-flashback && cd ~/.RSDE-flashback && sudo make install && cd ~/RSDE &&
echo -e "\n..................................Done.....................................\n" &&
echo -e "\nNow configuring some required settings for RSDE to run properly"
DESKTOP=$(gsettings get org.gnome.gnome-flashback desktop)
ROOT_BACKGROUND=$(gsettings get org.gnome.gnome-flashback root-background)
NOTIFICATIONS=$(gsettings get org.gnome.gnome-flashback notifications)
STATUS_NOTIFIER=$(gsettings get org.gnome.gnome-flashback status-notifier-watcher)
SWITCH_IN_SRC=$(gsettings get org.gnome.desktop.wm.keybindings switch-input-source)
SWITCH_IN_SRC_BCD=$(gsettings get org.gnome.desktop.wm.keybindings switch-input-source-backward)
echo "gsettings set org.gnome.gnome-flashback desktop ${DESKTOP} && gsettings set org.gnome.gnome-flashback root-background ${ROOT_BACKGROUND} && gsettings set org.gnome.gnome-flashback notifications ${NOTIFICATIONS} && gsettings set org.gnome.gnome-flashback status-notifier-watcher ${STATUS_NOTIFIER} && gsettings set org.gnome.desktop.wm.keybindings switch-input-source ${SWITCH_IN_SRC} && gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward ${SWITCH_IN_SRC_BCD}" > ~/.rsde.backup &&
gsettings set org.gnome.gnome-flashback desktop false && gsettings set org.gnome.gnome-flashback root-background true && gsettings set org.gnome.gnome-flashback notifications false && gsettings set org.gnome.gnome-flashback status-notifier-watcher false && gsettings set org.gnome.desktop.wm.keybindings switch-input-source '[<Alt><Super>space]' && gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward '[<Shift><Alt><Super>space]' &&
echo -e "\n...........................RSDE is ready to go.............................\n" &&
echo -e "\n................Now Reboot and select RSDE as your session.................\n"
