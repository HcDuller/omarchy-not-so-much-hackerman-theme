-- Not So Much Hackerman: a genuine local Neovim colorscheme (see
-- nvim-colorscheme/colors/not-so-much-hackerman.lua) forked from
-- bjarneo/hackerman.nvim, with the collapsed hue slots (purple/red/orange
-- were all shades of green) replaced by real, distinct hues so Keyword,
-- Number, and Tag/error highlighting regain contrast.
--
-- `dir` points at this theme's own permanent source folder under
-- ~/.config/omarchy/themes/, not the ephemeral current-theme staging copy,
-- so the same plugin identity/location can also be pre-registered in
-- ~/.config/nvim/lua/plugins/all-themes.lua for instant hot-reload without
-- restarting Neovim (see README "Live hot-reload" section).
return {
	{
		"bjarneo/aether.nvim",
		priority = 1000,
	},
	{
		"not-so-much-hackerman-colorscheme",
		dir = vim.fn.expand("~/.config/omarchy/themes/not-so-much-hackerman/nvim-colorscheme"),
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
