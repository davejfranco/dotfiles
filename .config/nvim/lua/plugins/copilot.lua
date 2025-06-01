return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      { "<leader>ae", "<cmd>Copilot enable<cr><cmd>Copilot status<cr>", desc = "Enable Copilot" },
      { "<leader>ad", "<cmd>Copilot disable<cr><cmd>Copilot status<cr>", desc = "Disable Copilot" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      { "<leader>am", "<cmd>CopilotChatModels<cr>", desc = "Chat Model to use"},
    }
  }
}
