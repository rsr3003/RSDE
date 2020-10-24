/bin/bash ~/.rsde_backup &&
cd ~/.RSDE-flashback && sudo make uninstall && cd &&
sudo apt purge --autoremove materia-gtk-theme papirus-icon-theme xfce4-panel xfce4-whiskermenu-plugin xfce4-notifyd xfce4-power-manager-plugins xfce4-indicator-plugin i3-gaps rofi compton fonts-source-code-pro-ttf gnome-flashback indicator-application -y &&
sudo add-apt-repository -r ppa:regolith-linux/release -y &&
echo -e "\n ........Uninstallation successful....... \n"

