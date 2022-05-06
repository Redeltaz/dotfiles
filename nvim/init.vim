set cursorline " highlight selected line
set number " show line number
set clipboard=unnamedplus " allow copy past inside and outside vim
set nowrap " unwrap lines
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin()

Plug 'neovim/nvim-lspconfig' " lsp client
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " color theme
Plug 'norcalli/nvim-colorizer.lua' " colorization of hexa, rgb, letter... 
Plug 'nvim-lualine/lualine.nvim' " bottom line
Plug 'kyazdani42/nvim-web-devicons' " icons to fit with multiples plugins
Plug 'kyazdani42/nvim-tree.lua' " side tree
Plug 'hrsh7th/cmp-nvim-lsp' " autocompletion for lsp config
Plug 'hrsh7th/nvim-cmp' " autocompletion plugin
Plug 'hrsh7th/cmp-buffer' " idk I need to import it
Plug 'hrsh7th/cmp-path' " autocompletion for path
Plug 'hrsh7th/cmp-cmdline' " autocompletion for command line
Plug 'jiangmiao/auto-pairs' " auto close brackets and other stuff
Plug 'akinsho/bufferline.nvim' " top bar that show opened buffer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim' " needed for telescope
Plug 'nvim-telescope/telescope.nvim' " fuzzy finder
Plug 'lewis6991/gitsigns.nvim' " git flow

call plug#end()
" source files
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/colors/tokyonight.lua
source $HOME/.config/nvim/config/plug-colorizer.lua
source $HOME/.config/nvim/config/nvim-tree-config.lua
source $HOME/.config/nvim/config/lsp.lua
source $HOME/.config/nvim/config/lualine-config.lua
source $HOME/.config/nvim/config/bufferline-config.lua
source $HOME/.config/nvim/config/treesitter-config.lua
source $HOME/.config/nvim/config/telescope.lua
source $HOME/.config/nvim/config/gitsigns.lua

" Auto install new plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
