--[[return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}--]]
return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		vim.cmd.colorscheme("kanagawa-wave")
	end,
}
