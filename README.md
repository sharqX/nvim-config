# Neovim Config

Personal Neovim configuration for Windows (PowerShell), built on Neovim 0.11+ features: the built-in `vim.pack` plugin manager and `vim.lsp.config` / `vim.lsp.enable`.

## Requirements

- Neovim 0.11+
- Git
- A C compiler for treesitter parsers (`gcc` works; on Windows `CC` is set to `gcc` automatically when `cl.exe` is missing)

Tools (LSP servers, formatters, linters) are installed automatically by Mason into `%LOCALAPPDATA%\nvim-data\mason\packages`.

## Install

```powershell
git clone <repo-url> "$env:LOCALAPPDATA\nvim"
nvim
```

Plugins install on first launch via `vim.pack`; Mason tools and treesitter parsers install shortly after.

## Layout

```
init.lua                          entrypoint; bootstraps load order
lua/craftzdog/
  config/                         options, keymaps, autocmds, commands, workarounds
  plugins/
    init.lua                      plugin list (vim.pack.add) + require order
    ui.lua treesitter.lua editor.lua lsp.lua util.lua keymaps.lua
    local.lua                     optional machine-local overrides (auto-loaded if present)
  utils/                          shared helpers exposed as _G.Craftzdog
after/lsp/                        per-server LSP overrides (lua_ls, vtsls, cssls, oxlint)
```

Load order (from `init.lua`): options → keymaps → autocmds → commands → workarounds → plugins.

## Managing plugins

Plugins are declared in `lua/craftzdog/plugins/init.lua`:

```lua
vim.pack.add({
	{ src = gh("owner/repo") },
	{ src = gh("owner/repo"), version = "branch-or-range" },
})
```

`gh()` is a helper that prefixes `https://github.com/`. `nvim-pack-lock.json` is generated and gitignored — don't edit it by hand. Run `:PackUpdate` to update.

## LSP

Servers are enabled in `lua/craftzdog/plugins/lsp.lua` with `vim.lsp.enable({...})` and configured via `vim.lsp.config`. Server-specific settings live in `after/lsp/<server>.lua` as `return { ... }` tables.

The `ensure_installed` list in `mason-tool-installer` (same file) is the source of truth for installed tools.

## Formatting

`conform.nvim` handles format-on-save:

- JavaScript/TypeScript/JSON/CSS/HTML/Markdown/YAML: `oxfmt → prettierd → prettier` (`oxfmt` only used when the project has `.oxfmtrc.json(c)`)
- Lua: `stylua`, Shell: `shfmt`, Fish: `fish_indent`

Toggle format-on-save for the current buffer with `:ToggleFormatter`.

## Conventions

- Leader key is `<space>`.
- Lua files are tab-indented (stylua defaults); other filetypes use 2-space indentation.
- Keymaps use a custom `map({...})` table helper in `plugins/keymaps.lua`.

## Verify

```powershell
nvim --headless "+qa" 2>&1
```

Or open `nvim` and run `:checkhealth`.

## Inspo

- [Effective Neovim Setup for Agentic Coding, Towards 2027](https://www.devas.life/effective-neovim-setup-for-agentic-coding-towards-2027/)
