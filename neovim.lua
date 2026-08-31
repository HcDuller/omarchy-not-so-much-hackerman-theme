-- Not So Much Hackerman: a genuine local Neovim colorscheme (see
-- nvim-colorscheme/colors/not-so-much-hackerman.lua) forked from
-- bjarneo/hackerman.nvim, with the collapsed hue slots (purple/red/orange
-- were all shades of green) replaced by real, distinct hues so Keyword,
-- Number, and Tag/error highlighting regain contrast.
return {
	{
		"bjarneo/aether.nvim",
		priority = 1000,
	},
	{
		"not-so-much-hackerman-colorscheme",
		dir = vim.fn.expand("~/.local/state/omarchy/current/theme/nvim-colorscheme"),
		dependencies = { "bjarneo/aether.nvim" },
		lazy = false,
		priority = 1000,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "not-so-much-hackerman",
		},
	},
}
