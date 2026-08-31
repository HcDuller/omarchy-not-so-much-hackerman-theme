# Not So Much Hackerman

An [Omarchy](https://omarchy.org/) theme forked from the stock **Hackerman**
theme, keeping its neon green/black "matrix" aesthetic for the terminal,
Hyprland, and UI chrome -- but with a genuinely fixed syntax-highlighting
palette for Neovim and VS Code.

## Why

Hackerman's original palette assigns 8 named hue slots (red, yellow, orange,
green, cyan, blue, purple, brown) for syntax highlighting, but nearly all of
them are shades of the same green/cyan hue -- for example, "purple" is
actually a mint-green, and "orange" is a light green. That collapses many
syntax categories (Keyword, Type, Number, Tag, Function, Variable, String...)
into visually identical or near-identical colors, making code hard to read
at a glance.

This theme keeps Hackerman's signature near-black background and
green/cyan accents, but spreads the syntax palette across genuinely distinct
hues -- modeled on how themes like Tokyo Night achieve contrast (hues spread
evenly around the color wheel in ~40-50 degree steps, saturation kept high,
lightness kept in a narrow bright band) -- so keywords, types, numbers,
strings, functions, variables, parameters, and tags are all easy to tell
apart, in both Neovim and VS Code.

## What's different from stock Hackerman

- **Neovim**: a real, independently-selectable colorscheme
  (`not-so-much-hackerman`, not just an alias for `hackerman`), with widened
  hues for Keyword (violet), Type/Class/Storage (teal, italic), Number/
  Boolean (amber), String (yellow), Function (true blue), Variable (green),
  Parameter (violet-magenta), Property/Member (cyan), and Tag/error (red/pink).
  Punctuation is bright but neutral/warm-tinted instead of stark white.
  "Word under cursor" highlighting (LSP references, `mini.cursorword`) now
  recolors the matched text itself (orange + bold), not just the background.
- **VS Code**: a matching local theme extension with the same widened
  palette applied across the full `tokenColors` list (not just a few
  entries), plus matching UI accent colors for errors/warnings/added/info
  indicators.
- **Everything else** (terminal ANSI colors, Hyprland borders, icons,
  backgrounds, lock screen) is unchanged from stock Hackerman.

## Installation

### Recommended: full functionality (Neovim + VS Code fixes included)

Omarchy strips any top-level `.lua` file (and `vscode.json`) from themes
installed via `omarchy theme install <url>`, because a git-installed theme
is treated as untrusted code. This theme's Neovim colorscheme itself
(`nvim-colorscheme/colors/not-so-much-hackerman.lua`) is a *nested* file and
survives a standard install just fine -- but `neovim.lua` at the top level
(which tells LazyVim to actually use that colorscheme) does not. Installing
the standard way therefore gives you the terminal/Hyprland/UI palette
immediately, but **the Neovim colorscheme won't apply automatically** unless
you also do one of:

```bash
# Option A: install without a .git folder, so nothing gets stripped
git clone git@github.com:HcDuller/omarchy-not-so-much-hackerman-theme.git /tmp/not-so-much-hackerman
cp -r /tmp/not-so-much-hackerman ~/.config/omarchy/themes/not-so-much-hackerman
rm -rf ~/.config/omarchy/themes/not-so-much-hackerman/.git
rm -rf /tmp/not-so-much-hackerman
omarchy theme set "not-so-much-hackerman"
```

```bash
# Option B: installed via the menu already? Just add neovim.lua yourself --
# files you add locally on top of an installed theme are never stripped.
curl -o ~/.config/omarchy/themes/not-so-much-hackerman/neovim.lua \
  https://raw.githubusercontent.com/HcDuller/omarchy-not-so-much-hackerman-theme/master/neovim.lua
omarchy theme set "not-so-much-hackerman"
```

### VS Code (manual step, required either way)

Omarchy doesn't manage VS Code extensions, so this is always a manual,
one-time step:

```bash
ln -s ~/.config/omarchy/themes/not-so-much-hackerman/vscode-extension \
      ~/.vscode/extensions/not-so-much-hackerman-theme
```

Then reload VS Code (`Developer: Reload Window`) and select **Not So Much
Hackerman** from the theme picker if it isn't applied automatically.

## Live hot-reload in Neovim (optional, local-machine only)

By default, switching to this theme while a Neovim session that predates
the switch is still open may report `Cannot find color scheme
"not-so-much-hackerman"` if you try `:colorscheme not-so-much-hackerman`
manually -- `lazy.nvim` only discovers plugin specs at startup, and this
theme's colorscheme plugin isn't known to a session that started before the
switch. **A new Neovim instance started after the switch always loads it
correctly**, so this only matters if you want theme switches to apply live,
without restarting Neovim.

Omarchy's own bundled themes avoid this by pre-registering every built-in
colorscheme plugin up front in `~/.config/nvim/lua/plugins/all-themes.lua`.
You can do the same for this theme -- since that file lives outside this
repo (it's your own Neovim config, not something an Omarchy theme can ship),
add this entry yourself once, alongside the existing ones:

```lua
{
  "not-so-much-hackerman-colorscheme",
  dir = vim.fn.expand("~/.config/omarchy/themes/not-so-much-hackerman/nvim-colorscheme"),
  dependencies = { "bjarneo/aether.nvim" },
  lazy = true,
  priority = 1000,
},
```

After adding this once, switching to (or away from and back to) this theme
via `omarchy theme set` or the Omarchy menu will hot-reload instantly in any
already-open Neovim session, exactly like the built-in themes.

## Preview

> The theme preview screenshot (`preview.png`) still shows stock Hackerman
> and needs to be replaced with a real screenshot of this theme. The lock
> screen assets (`unlock.png`, `preview-unlock.png`) are already regenerated
> to match this theme's actual colors.

## Credits

Forked from:
- [Hackerman](https://github.com/bjarneo/hackerman-vscode) (Omarchy theme /
  VS Code theme) by Bjarne Oeverli
- [aether.nvim](https://github.com/bjarneo/aether.nvim) by Bjarne Oeverli
- [hackerman.nvim](https://github.com/bjarneo/hackerman.nvim) by Bjarne Oeverli

Hue-spacing approach inspired by
[Tokyo Night](https://github.com/folke/tokyonight.nvim).

## License

MIT, see [LICENSE](./LICENSE). Includes and credits the original MIT-licensed
work by Bjarne Oeverli.
