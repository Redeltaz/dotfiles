#!/bin/bash

git clone https://github.com/Redeltaz/dotfiles ~/dotfiles

zsh_setup () {
    # set zsh and p10k
    echo "-------------------------"
    echo "Starting zsh installation"
    echo "-------------------------"
    echo y | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    #chsh -s /bin/zsh

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
    cp ~/dotfiles/zsh/p10k ~/.p10k.zsh 
}

zsh_setup 
