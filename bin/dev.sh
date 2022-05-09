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
        unzip \
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
    echo "--------------------------"
    echo "Starting nvim installation"
    echo "--------------------------"

    wget -P $install_path https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
    sudo apt install $install_path/nvim-linux64.deb
    rm $install_path/nvim-linux64.deb
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    # Needed for treesitter
    sudo apt install -y \
        gcc \
        build-essential \
        aptitude \
        libstdc++6

    # Setup fonts for icons
    mkdir -p $path/.local/share/fonts

    wget -P $install_path/font https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
    unzip $install_path/font/Ubuntu.zip -d $install_path/font/Ubuntu
    cp $install_path/font/Ubuntu/"Ubuntu Nerd Font Complete.ttf" $path/.local/share/fonts
    wget -p $install_path/font https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
    unzip $install_path/font/JetBrainsMono-2.242.zip -d $install_path/font/JetBrains
    cp $install_path/font/JetBrains/fonts/ttf/JetBrainsMono-Regular.ttf $path/.local/share/fonts

    fc-cache -fv
    rm -rf $install_path/font 
}

tmux_setup () {
    # set tmux and all the plugins
    echo "--------------------------"
    echo "Starting tmux installation"
    echo "--------------------------"

    sudo apt install tmux
    git clone https://github.com/tmux-plugins/tpm $path/.tmux/plugins/tpm
    cp $install_path/dotfiles/tmux/tmux.conf $path/.tmux.conf
}

basic_setup
zsh_setup
nvim_setup
tmux_setup
