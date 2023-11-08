# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# List of plugins 
plugins=(git zsh-autosuggestions)

# Activate p10k theme
source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# List of alias
alias pip="pip3"
alias python="python3"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias ls="exa"
alias l="exa -la --icons"
alias gg="ping 8.8.8.8"
alias k="kubectl"
alias dc="docker compose"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"


export PATH="$PATH:$HOME/.local/bin/:$HOME/.dotfiles/bin"

# init fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# init asdf 
. "$HOME/.asdf/asdf.sh"
