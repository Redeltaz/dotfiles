#!/bin/bash

# Install only the most important for dev enrionnement (on remote machine for exemple)

install_path=/tmp/dotfiles-install

if [ "$USER" = "root" ]; then
    path=/root 
else
    path=/home/$USER
fi

setup_i3 () {
    echo 'XKBVARIANT="intl"' >> /etc/default/keyboard
}

install_i3_software () {
    sudo apt install -y \
        pavucontrol \
        lxappearance \
        flameshot \
        fonts-material-design-icons-iconfont \
        fonts-font-awesome
}
