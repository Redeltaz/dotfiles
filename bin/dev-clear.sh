#!/bin/bash

# Clear what the dev script install

if [ "$USER" = "root" ]; then
    path=/root 
else 
    path=/home/$USER
fi

remove_packages () {
    sudo apt remove -y \
        zsh \
        nodejs \
        zsh-autosuggestion \
        nvim \
        gcc \
        build-essential \
        aptitude \
        libstdc==6 \
        tmux

   sudo npm uninstall -g typescript \
        typescript-language-server \
        bash-language-sever \
        dockerfile-language-server-nodejs \
        vim-language-server \
        vscode-langservers-extracted \
        pyright
}

remove_content () {
    rm -rf /tmp/dotfiles-install
    rm -rf $path/powerlevel10k
    rm $path/.p10k.zsh
    rm -rf $path/.oh-my-zsh
    rm $path/.zshrc
    rm -rf $path/.config/nvim
    rm $path/.local/share/fonts/JetBrainsMono-Regular.ttf
    rm $path/.local/share/fonts/"Ubuntu Nerd Font Complete.ttf"
    rm -rf $path/.tmux
    rm $path/.tmux.conf
}

revert_command () {
    sudo usermod -s /bin/bash $USER

    fc-cache -fv
}

remove_packages
remove_content
revert_command

cat << EOF
############################################################
############################################################
##### Dev environnement cleared, you need to restart   #####
#####    your session to apply last modifications.     #####
############################################################
############################################################
##### You can type 'bash' to finally change your shell #####
############################################################
############################################################
EOF
