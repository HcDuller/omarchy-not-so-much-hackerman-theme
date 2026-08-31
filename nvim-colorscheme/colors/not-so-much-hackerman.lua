-- Not So Much Hackerman: a genuine, independently-selectable Neovim colorscheme
-- forked from bjarneo/hackerman.nvim's colors/hackerman.lua.
--
-- Hackerman's original palette assigns 8 named hue slots (red, yellow,
-- orange, green, cyan, blue, purple, brown) but nearly all of them are
-- shades of the same green/cyan hue -- "purple" is actually mint-green,
-- "orange" is light-green, etc. That collapses many syntax categories
-- (Keyword, Type, Number, Tag...) into visually identical colors.
--
-- Fix strategy (measured via HSL, modeled on how Tokyo Night achieves
-- contrast): spread hues evenly around the wheel in ~40-50 degree steps,
-- keep saturation high and lightness in a narrow bright band, and let hue
-- -- not brightness -- be the primary differentiator between categories.
--
-- Resulting hue map (approx degrees): orange 34, yellow 80, green 154,
-- cyan 185, blue 223, purple 261, violet-magenta 281, red 345.
require("aether").load({
	name = "not-so-much-hackerman",
	colors = {
		bg         = "#0B0C16",
		dark_bg    = "#080911",
		darker_bg  = "#05060c",
		lighter_bg = "#1a1d2b",

		fg         = "#ddf7ff",
		dark_fg    = "#85E1FB",
		light_fg   = "#e5faff",
		bright_fg  = "#f0fcff",
		muted      = "#6a6e95",

		-- red: was #50f872 (a green), now a genuine red/pink (H345)
		red        = "#ff5f87",
		-- yellow: shifted to a gold-green (H80), distinct from green and orange
		yellow     = "#c9f76a",
		-- orange: was #85ff9d (a light green), now a genuine amber (H34)
		orange     = "#ffb454",
		-- green: nudged from H145 to H154 for more breathing room from cyan
		green      = "#4fe0a0",
		-- cyan: nudged from H180 to H185 and more saturated, separating it
		-- further from both green and the new true-blue
		cyan       = "#5be3f0",
		-- blue: was #5ec8d4 (H186, nearly identical hue to cyan!), now a
		-- real true blue (H223) so Function/Statement genuinely differs
		-- from PreProc/Special (cyan) and Identifier (bright_cyan)
		blue       = "#5f8dff",
		-- purple: was #6fd4a8 (a mint-green, mislabeled "purple"), now a
		-- real violet (H261), used for Keyword and related groups
		purple     = "#b18cf7",
		-- brown: unused by aether.nvim's highlight groups, repurposed here
		-- as a second violet-magenta (H281) wired to @variable.parameter
		-- below, so parameters read distinctly from object members (cyan)
		brown      = "#d68cf7",

		bright_red    = "#ff8fab",
		bright_yellow = "#e3ffa0",
		bright_green  = "#7cf8a8",
		bright_cyan   = "#a4faf9",
		-- bright_blue: was #85dfe5 (H184, same hue family as cyan!),
		-- now a lighter tint of true blue (H223), used by Folded/
		-- DiagnosticVirtualTextInfo/@punctuation.special
		bright_blue   = "#9eb8fa",
		bright_purple = "#d4bbfa",

		accent               = "#50f872",
		cursor               = "#ddf7ff",
		foreground           = "#ddf7ff",
		background           = "#0B0C16",
		selection            = "#1a1d2b",
		selection_foreground = "#ddf7ff",
		selection_background = "#1a1d2b",
	},
})

-- aether.nvim maps both @variable.member and @variable.parameter to `cyan`
-- (identical). Since colors/not-so-much-hackerman.lua re-executes fully on
-- every `:colorscheme not-so-much-hackerman`, applying overrides here directly
-- (no autocmd needed) is guaranteed to run every time -- unlike the earlier
-- ColorScheme-autocmd approach, which could miss re-firing across theme
-- hot-reloads. Use the spare "brown" slot (recolored to violet-magenta,
-- H281) to split parameters from members.
vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#d68cf7" })
-- @variable.parameter.builtin (self/cls) was blended yellow; align it with
-- the same violet-magenta used for regular parameters instead.
vim.api.nvim_set_hl(0, "@variable.parameter.builtin", { fg = "#e0b3f7" })

-- String/Character were `c.green`, identical to nothing else in Neovim's
-- own groups today, but this shifts them to `c.yellow` (H80) to match the
-- equivalent fix applied to the VS Code theme (String moved off Green,
-- which collided with Variables there). `@string` links to `String`, so
-- overriding `String` here also updates it.
local YELLOW = "#c9f76a"
local BRIGHT_YELLOW = "#e3ffa0"
-- New teal (H165), distinct from both green (H154) and cyan (H185), used
-- for Type/StorageClass/Structure/Typedef/Label now that String has taken
-- over `yellow`. Paired with italic so it reads as its own category even
-- where hue alone sits close to its green/cyan neighbors.
local TYPE_TEAL = "#53eac4"

vim.api.nvim_set_hl(0, "String", { fg = YELLOW })
vim.api.nvim_set_hl(0, "Character", { fg = YELLOW })

vim.api.nvim_set_hl(0, "Type", { fg = TYPE_TEAL, bold = true, italic = true })
vim.api.nvim_set_hl(0, "StorageClass", { fg = TYPE_TEAL, italic = true })
vim.api.nvim_set_hl(0, "Structure", { fg = TYPE_TEAL, italic = true })
vim.api.nvim_set_hl(0, "Typedef", { fg = TYPE_TEAL, italic = true })
vim.api.nvim_set_hl(0, "Label", { fg = TYPE_TEAL, italic = true })
vim.api.nvim_set_hl(0, "@constructor", { fg = TYPE_TEAL, italic = true })
vim.api.nvim_set_hl(0, "@label", { fg = TYPE_TEAL, italic = true })

-- @string.documentation was also `c.yellow` -- previously distinct from
-- String (which was green), but now String is yellow too. Give docstrings
-- a lighter tint + italic so they stay visually distinct from regular
-- string literals.
vim.api.nvim_set_hl(0, "@string.documentation", { fg = BRIGHT_YELLOW, italic = true })

-- Punctuation: aether.nvim dims brackets/delimiters by blending the
-- foreground toward the background (a "recede into the dark" look). Match
-- the VS Code theme's choice instead: bright, but shifted to a neutral,
-- warm/orange-tinted color so punctuation stays legible without competing
-- with actual syntax colors.
local PUNCTUATION_NEUTRAL = "#e3ceb5"
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = PUNCTUATION_NEUTRAL })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = PUNCTUATION_NEUTRAL })
vim.api.nvim_set_hl(0, "@punctuation.special", { fg = PUNCTUATION_NEUTRAL })
vim.api.nvim_set_hl(0, "Delimiter", { fg = PUNCTUATION_NEUTRAL })

-- "Other occurrences of the word under the cursor" highlighting: both
-- LSP document-highlight (LspReferenceText/Read/Write) and mini.cursorword
-- only tint the *background* in aether.nvim, leaving text the same plain
-- foreground color -- easy to miss. Recolor the text itself to orange +
-- bold, with a subtle warm-amber background (an 18% blend of the orange
-- accent into the theme's near-black) instead of the generic dark-blue
-- selection tint, so text and background read as one cohesive highlight.
local ORANGE = "#ffb454"
local ORANGE_BG = "#372a21"
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = ORANGE_BG, fg = ORANGE, bold = true })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = ORANGE_BG, fg = ORANGE, bold = true })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = ORANGE_BG, fg = ORANGE, bold = true })
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = ORANGE_BG, fg = ORANGE, bold = true })
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = ORANGE_BG, fg = ORANGE, bold = true })
