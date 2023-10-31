# Dotfiles

All my dotfiles, I used to be on Arch on full DIY config with i3 but I now moved to Gnome for simplicity.
All my old config for dunst, i3, polybar... is still available on the [legacy](./legacy/) folder.

## Installation

Be sure to have at leat curl installed (and your network can reach internet)

Then you can type :
```bash
curl -fsSL https://redeltaz.github.io/dotfiles/etc/install | bash
```

You now have to add the `~/.dotfiles/bin` folder into `$PATH` :
```bash
echo "export PATH="$HOME/.dotfiles/bin"" >> ~/.zshrc
```

The dotfiles CLI will be installed and usable to manage the config. If an error appear, you can create an [issue](https://github.com/Redeltaz/dotfiles/issues/new)
## Informations

|   |   |
|---|---|
|**OS**| [Arch](https://archlinux.fr/) |
| **WM** | [Gnome](https://www.gnome.org/) |
| **Terminal** | [Alacritty](https://github.com/alacritty/alacritty) |
| **Shell** | [zsh](https://github.com/ohmyzsh/ohmyzsh) |
| **Editor** | [neovim](https://github.com/neovim/neovim) |
| **Terminal Multiplexer** | [tmux](https://github.com/tmux/tmux) |
