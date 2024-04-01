return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  },
  -- key mappings
  vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { noremap = true, silent = true }),
  --vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>disable diagnostics<cr>", { noremap = true, silent = true }),
}
