vim.cmd("set number")
-- Tab settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- Leader
vim.g.mapleader = " "
-- Disable LSP log
vim.lsp.set_log_level("off")
