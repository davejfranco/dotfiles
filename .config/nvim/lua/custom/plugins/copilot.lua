return {
  'github/copilot.vim',
  event = 'BufEnter',
  config = function()
    -- Accept Copilot suggestion
    vim.keymap.set('i', '<C-i>', 'copilot#Accept("<CR>")', { expr = true, silent = true, desc = 'Accept Copilot suggestion' })

    -- Cycle suggestions (next)
    vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)', { silent = true, desc = 'Cycle to next Copilot suggestion' })

    -- Cycle suggestions (previous)
    vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)', { silent = true, desc = 'Cycle to previous Copilot suggestion' })

    -- Dismiss suggestion
    vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)', { silent = true, desc = 'Dismiss Copilot suggestion' })

    -- Enable Copilot
    vim.keymap.set('n', '<C-e>', function()
      vim.cmd 'Copilot enable'
      print 'Copilot enabled'
    end, { silent = true, desc = 'Enable Copilot' })

    -- Disable Copilot
    vim.keymap.set('n', '<C-d>', function()
      vim.cmd 'Copilot disable'
      print 'Copilot disabled'
    end, { silent = true, desc = 'Disable Copilot' })
  end,
}
