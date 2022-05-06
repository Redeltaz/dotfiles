#!/bin/bash

# Install only the most important for dev enrionnement (on remote machine for exemple)

install_path=/tmp/dotfiles-install

if [ "$USER" = "root" ]; then
    path=/root 
else
    path=/home/$USER
fi

basic_setup () {
    mkdir -p $install_path 

    sudo -v
    sudo apt install -y \
        curl \
        tar \
        zsh

    git clone https://github.com/Redeltaz/dotfiles $install_path/dotfiles
}

zsh_setup () {
    # set oh-my-zsh and p10k
    echo "-------------------------"
    echo "Starting zsh installation"
    echo "-------------------------"
    echo y | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo usermod -s /bin/zsh $USER

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $path/powerlevel10k
    cp $install_path/dotfiles/zsh/p10k $path/.p10k.zsh 
    wget -P $install_path https://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_21.10/amd64/zsh-autosuggestions_0.7.0-1+2.1_amd64.deb
    sudo apt install $install_path/zsh-autosuggestions_0.7.0-1+2.1_amd64.deb
    rm $install_path/zsh-autosuggestions_0.7.0-1+2.1_amd64.deb
    git clone https://github.com/zsh-users/zsh-autosuggestions $path/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/agkozak/zsh-z $path/.oh-my-zsh/plugins/zsh-z

    cp $install_path/dotfiles/zsh/zshrc $path/.zshrc
}

nvim_setup () {
    # set nvim and all the plugins
    echo "-------------------------"
    echo "Starting zsh installation"
    echo "-------------------------"
    wget -P $install_path https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
    sudo apt install $install_path/nvim-linux64.deb
    rm $install_path/nvim-linux64.deb
    sudo apt install -y \
        gcc \
        build-essential \
        aptitude \
        libstdc++
}

basic_setup
zsh_setup
