#!/bin/bash

setup_basics () {
    apt update -y
    apt upgrade -y

    apt install -y \
        git \
        curl \
        wget \

    git clone https://github.com/Redeltaz/dotfiles
}

zsh_setup () {
    # set zsh and p10k
    if ["which $SHELL" != "/bin/zsh"]
        echo "ZSH not setup, running installation..."
        apt install -y zsh
        echo y | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        chsh -s /bin/zsh
        zsh
    fi

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    cp ~/Applications/Dotfiles/config/p10k/.p10k.zsh ~/.p10k.zsh 
    echo y | source ~/.zshrc 
}
