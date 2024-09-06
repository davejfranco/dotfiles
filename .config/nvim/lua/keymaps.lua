-- Move between buffers
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
-- Split Window
vim.api.nvim_set_keymap("n", "<c-vs>", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-hs>", ":split<CR>", { noremap = true, silent = true })
-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
