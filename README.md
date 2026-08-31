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
is treated as untrusted code. Since this theme's Neovim integration relies on
`neovim.lua`, installing it the standard way means **you won't get the
Neovim colorscheme automatically**. To get full functionality:

```bash
git clone git@github.com:HcDuller/omarchy-not-so-much-hackerman-theme.git /tmp/not-so-much-hackerman
cp -r /tmp/not-so-much-hackerman ~/.config/omarchy/themes/not-so-much-hackerman
rm -rf ~/.config/omarchy/themes/not-so-much-hackerman/.git
rm -rf /tmp/not-so-much-hackerman
omarchy theme set "not-so-much-hackerman"
```

Because there's no `.git` directory left inside
`~/.config/omarchy/themes/not-so-much-hackerman`, Omarchy treats it as a
theme you authored yourself, so nothing gets stripped.

### Alternative: via the Omarchy menu / `omarchy theme install`

```
Install > Style > Theme
```
and paste the repo URL. This works and gives you the terminal/Hyprland/UI
palette immediately, but **the Neovim colorscheme will not apply
automatically** (see above). If you install this way and still want the
Neovim fix, copy `neovim.lua` and `nvim-colorscheme/` from this repo into
`~/.config/omarchy/themes/not-so-much-hackerman/` yourself afterward --
files you add locally on top of an installed theme are never stripped.

### VS Code (manual step, required either way)

Omarchy doesn't manage VS Code extensions, so this is always a manual,
one-time step:

```bash
ln -s ~/.config/omarchy/themes/not-so-much-hackerman/vscode-extension \
      ~/.vscode/extensions/not-so-much-hackerman-theme
```

Then reload VS Code (`Developer: Reload Window`) and select **Not So Much
Hackerman** from the theme picker if it isn't applied automatically.

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
