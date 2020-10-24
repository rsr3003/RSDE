#! /bin/bash

git clone https://github.com/rsr3003/RSDE.git ~/RSDE && cd ~/RSDE
echo -e "Downloading the prerequisite packages for RSDE..." &&
sudo apt update -y && sudo apt upgrade -y &&
sudo apt install git gnome-flashback xrdp indicator-application build-essential -y &&
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
git clone https://github.com/rsr3003/RSDE-gnome-flashback.git ~/.RSDE-flashback && cd ~/.RSDE-flashback && sudo make install && cd &&
echo -e "\n..................................Done.....................................\n" &&
echo -e "\nNow configuring some required settings for RSDE to run properly"
DESKTOP=$(gsettings get org.gnome.gnome-flashback desktop)
ROOT_BACKGROUND=$(gsettings get org.gnome.gnome-flashback root-background)
NOTIFICATIONS=$(gsettings get org.gnome.gnome-flashback notifications)
STATUS_NOTIFIER=$(gsettings get org.gnome.gnome-flashback status-notifier-watcher)
SWITCH_IN_SRC=$(gsettings get org.gnome.desktop.wm.keybindings switch-input-source)
SWITCH_IN_SRC_BCD=$(gsettings get org.gnome.desktop.wm.keybindings switch-input-source-backward)
echo "gsettings set org.gnome.gnome-flashback desktop ${DESKTOP} && gsettings set org.gnome.gnome-flashback root-background ${ROOT_BACKGROUND} && gsettings set org.gnome.gnome-flashback notifications ${NOTIFICATIONS} && gsettings set org.gnome.gnome-flashback status-notifier-watcher ${STATUS_NOTIFIER} && gsettings set org.gnome.desktop.wm.keybindings switch-input-source ${SWITCH_IN_SRC} && gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward ${SWITCH_IN_SRC_BCD}" > ~/.rsde_backup &&
gsettings set org.gnome.gnome-flashback desktop false && gsettings set org.gnome.gnome-flashback root-background true && gsettings set org.gnome.gnome-flashback notifications false && gsettings set org.gnome.gnome-flashback status-notifier-watcher false && gsettings set org.gnome.desktop.wm.keybindings switch-input-source '[<Alt><Super>space]' && gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward ['<Shift><Alt><Super>space'] &&
echo -e "\nNow Installing & applying the the default gtk & icon theme you can apply them later"
sudo apt install materia-gtk-theme papirus-icon-theme -y
echo -e "\nSetting up XRDP"
sudo cp /etc/xrdp/xrdb.ini /etc/xrdp/xrdp-backup.ini &&
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
sudo cp startwm.sh /etc/xrdp/
echo -e "\n...........................RSDE is ready to go.............................\n" &&
echo -e "\n...........Start xRDP service by \"sudo /etc/init.d/xrdp start\"...........\n"
echo -e "\n.......Open \"Remote Desktop Connection\" from Windows & connect to \"localhost:3390\"......\n"
