return require('packer').startup(function()
    --- Managing packer
    use 'wbthomason/packer.nvim'

    --- Tokyo Night colorsheme
    use 'folke/tokyonight.nvim'

    --- Sidebar
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- buffer top bar
    use {
        'akinsho/bufferline.nvim', 
        tag = "v2.*", 
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- buffer bottom bar
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 
          'kyazdani42/nvim-web-devicons', 
          opt = true 
      }
    }

    -- git flow
    use 'lewis6991/gitsigns.nvim'

    -- auto pair
    use 'windwp/nvim-autopairs'

    -- easy comment
    use 'scrooloose/nerdcommenter'

    -- Indent line
    use "lukas-reineke/indent-blankline.nvim"

    -- fuzzyfinder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    
    -- start screen
    use 'mhinz/vim-startify'

    -- open terminal
    use "akinsho/toggleterm.nvim"

    -- lsp 
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Syntax colorizer
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use 'pearofducks/ansible-vim'

    -- Fuzzyfinder for files grep
    use {'junegunn/fzf', run = './install --all' }
    use 'junegunn/fzf.vim'

    use 'rafamadriz/friendly-snippets'

    use 'chr4/nginx.vim'
end)
