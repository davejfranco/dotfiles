-- Github
return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme github_dark_dimmed")
	end,
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
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}--]]
-- Kanawa theme
--[[return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		vim.cmd.colorscheme("kanagawa-wave")
	end,
}]]
--
