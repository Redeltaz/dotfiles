local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
}

vim.cmd('nnoremap <silent> <C-f> :Telescope find_files<CR>')
