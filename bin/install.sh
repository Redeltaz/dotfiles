#!/bin/bash

# Install desktop environnement
# You need at least to install curl

set -xe
sudo -v

install_path=/tmp/dotfiles-install

if [ "$USER" = "root" ]; then
    path=/root 
else
    path=/home/$USER
fi

mkdir -p $install_path 

get_repo () {
    "##### Clone repository #####"

    sudo pacman -S --noconfirm git 
    git clone https://github.com/Redeltaz/dotfiles $install_path
}

get_fonts () {
    echo "##### Get Fonts #####"

    mkdir -p $path/.local/share/fonts
    mkdir $install_path/fonts

    sudo pacman -S --nocontrol unzip

    wget -P $install_path/font https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
    unzip $install_path/font/JetBrainsMono.zip -d $install_path/font/Jetbrainsmono
    cp $install_path/font/Jetbrainsmono/"JetBrains Mono Regular Nerd Font Complete.ttf" $path/.local/share/fonts

    sudo pacman -S --noconfirm \
        noto-fonts \
        noto-fonts-emoji \
        ttf-linux-libertine \
        ttf-dejavu

    fc-cache -fv
}

setup_i3_ui () {
    echo "##### Setup i3 #####"

    cp $install_path/dotfiles/i3/config $path/.config/i3/
    sudo timedatectl set-timezone Europe/Paris

    sudo pacman -S --noconfirm \
        polybar \
        feh \
        flameshot \
        lxappearance \
        nautilus \
        dunst 

    cp -r $install_path/dotfiles/polybar

    mkdir -p $path/.config/dunst
    cp $install_path/dotfiles/dunst/dunstrc $path/.config/dunst/

    sudo cp -r $install_path/dotfiles/gnome/theme/TokyoNight /usr/share/themes

    mkdir -p $path/{Documents,Pictures,Downloads}
    mkdir -p $path/Pictures/Wallpapers
    cp -r $install_path/dotfiles/wallpapers/* $path/dotfiles/Wallpapers/
}

setup_terminal () {
    echo "##### Setup Terminal #####"

    sudo pacman -S --noconfirm \
        alacritty \
        tmux \
        neofetech \
        zsh

    cp $install_path/dotfiles/alacritty/alacritty.yml $path/.config/

    git clone https://github.com/tmux-plugins/tpm $path/.tmux/plugins/tpm
    cp $install_path/dotfiles/tmux/tmux.conf $path/.tmux.conf
    $path/.tmux/plugins/tpm/scripts/install_plugins.sh

    sudo cp $install_path/dotfiles/zsh/neofetch /bin/neofetch
    mkdir $path/.config/neofetch
    cp $install_path/dotfiles/zsh/neofetch-config .config/neofetch/config.conf

    echo y | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo usermod -s /bin/zsh $USER
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $path/powerlevel10k
    cp $install_path/dotfiles/zsh/p10k $path/.p10k.zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    cp $install_path/dotfiles/zsh/zshrc $path/.zshrc
}

setup_nvim () {
    echo "##### Setup nvim #####"

    sudo pacman -S --noconfirm \
        vi \
        vim \
        neovim

    cp -r $install_path/dotfiles/nvim $path/.config/nvim

    nvim "+PackerInstall" +qall

    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install_utils () {
    echo "##### install more utils #####"

    sudo pacman -S --noconfirm \
        pavucontrol \
        notify-send \
        libnotify \
        rofi \
        firefox \
        yay \
        exa

    mkdir -p $path/.config/rofi
    cp $install_path/rofi/config.rasi $path/.config/rofi/

    yes | yay -S ferdium
}

get_repo
get_fonts
setup_i3_ui
setup_terminal
setup_nvim
install_utils
