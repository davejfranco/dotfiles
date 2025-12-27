--Toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config({
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  })
end, { desc = "toggle diagnostic" })
-- keymap to toggle diagnostics
vim.api.nvim_set_keymap("n", "<leader>dt", ":DiagnosticToggle<CR>", { noremap = true, silent = true })
