return {
  "navarasu/onedark.nvim",
  lazy = false,
  config = function()
     style = "darker"
    vim.cmd "colorscheme onedark"
  end
}
-- catppuccino theme
--[[return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin-mocha",
  priority = 1000,
  integrations = {
    treesitter = true,
    cmp = true,
  },
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}]]--
-- Kanawa theme
--[[return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		vim.cmd.colorscheme("kanagawa-wave")
	end,
}]]--
