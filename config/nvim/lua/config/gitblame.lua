require('gitblame').setup {
    enabled = true,
}
vim.g.gitblame_message_when_not_committed = 'Not commited'
vim.g.gitblame_date_format = '%x'
