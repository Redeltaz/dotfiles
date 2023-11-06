require("nvim-treesitter.configs").setup ({
  -- A list of parser names, or "all"
  ensure_installed = { 
      "terraform", 
      "bash", 
      "dockerfile", 
      "go", 
      "html", 
      "json", 
      "lua", 
      "php", 
      "python", 
      "scss", 
      "tsx", 
      "typescript", 
      "javascript", 
      "vim", 
      "regex", 
      "yaml", 
      "hcl", 
      "markdown" 
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
