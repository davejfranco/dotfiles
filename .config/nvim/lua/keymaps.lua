-- Move between buffers
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
-- Split Window
--vim.api.nvim_set_keymap("n", "<C-vs>", ":vsplit<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<C-hs>", ":split<CR>", { noremap = true, silent = true })
