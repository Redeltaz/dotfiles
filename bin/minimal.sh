#!/bin/bash

shell_user=$1
install_path=/tmp/dotfiles-install

if [ -z $shell_user ]; then
    echo "User parameter needed"
    exit 1 
fi

if [ "$shell_user" = "root" ]; then
    if [ "$USER" != "root" ]; then
        echo "You need to run as root if you want to update root"
        exit 1
    fi

    path=/root 
else
    path=/home/$shell_user
fi

is_user=$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | grep -w $shell_user)

basic_setup () {
    mkdir -p $install_path 

    sudo -v
    sudo apt install -y \
        curl \
        tar \
        zsh

    git clone https://github.com/Redeltaz/dotfiles $path/dotfiles
}

zsh_setup () {
    # set zsh and p10k
    echo "-------------------------"
    echo "Starting zsh installation"
    echo "-------------------------"
    echo y | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo usermod -s /bin/zsh $shell_user

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $path/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $path/.zshrc
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> $path/.zshrc
    cp $install_path/dotfiles/zsh/p10k $path/.p10k.zsh 
}

nvim_setup () {
    wget -P $install_path https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
    sudo apt install $install_path/nvim-linux64.deb
    rm $install_path/nvim-linux64.deb
    sudo apt install -y \
        gcc \
        build-essential \
        aptitude \
        libstdc++
}

if [ ! -z $is_user ] || [ "$shell_user" = "root" ]; then
    basic_setup
    zsh_setup
else
    echo "This user does not exist here"
    exit 1 
fi
