return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "go", "python", "vim", "bash", "terraform"},
      auto_install = true, 
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}

