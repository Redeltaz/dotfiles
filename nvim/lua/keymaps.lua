local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- NORMAL
-- Split windows navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Comment line
keymap("n", "<C-_>", ":call nerdcommenter#Comment(0, 'toggle')<CR>", opts)

-- Quit window
keymap("n", "<S-d>", ":q<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close current buffer
keymap("n", "<C-d>", ":bd<CR>", opts)

-- Split screen
keymap("n", "<C-s>", ":vsplit<CR>", opts)

-- Nvim-tree shortcuts
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<S-n>", ":NvimTreeFocus<CR>", opts)

-- Show fuzzyfinder
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)

-- ToggleTerm
keymap("n", "<C-Space>", ":ToggleTerm direction=float<CR>", opts)

-- VISUAL
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Comment line
keymap("v", "<C-_>", ":call nerdcommenter#Comment(0, 'toggle')<CR>", opts)
