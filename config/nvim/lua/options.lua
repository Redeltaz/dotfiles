--vim.opt.cursorline = true --highlight selected line
vim.opt.number = true --show line number
vim.opt.clipboard = "unnamedplus" --allow copy past inside and outside vim
vim.opt.wrap = false --unwrap lines
vim.opt.termguicolors = true --allow terminal colors
vim.opt.tabstop = 4 --max width of a tab character
vim.opt.shiftwidth = 4 --size of and indent
vim.opt.expandtab = true --tab key insert spaces instead of tab

-- Setup nvim to CWD when path specified
if next(vim.fn.argv()) ~= nil then
    vim.cmd('cd %:h')
end
