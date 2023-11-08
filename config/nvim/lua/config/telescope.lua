local actions = require "telescope.actions"

require('telescope').setup{
  pickers = {
    find_files = {
      hidden = true
    }
  },
  defaults = {
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
}
