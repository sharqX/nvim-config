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

## Keymaps

Defined in `lua/craftzdog/config/keymaps.lua` (general) and `lua/craftzdog/plugins/keymaps.lua` (plugin-specific).

### General

| Key | Action |
| --- | --- |
| `x` | Delete char without yanking (black hole register) |
| `<leader>p` / `<leader>P` | Paste from last-yank register (n + v for `p`) |
| `<leader>c` / `<leader>C` | Change into black hole register (n + v) |
| `<leader>d` / `<leader>D` | Delete into black hole register (n + v) |
| `+` / `-` | Increment / decrement number |
| `dw` | Delete word backwards |
| `<C-a>` | Select all |
| `<leader>o` / `<leader>O` | New line without auto-continuing comments |
| `<C-m>` | Jump forward in jumplist |
| `ZR` | Restart nvim, restoring windows, tabs, and buffers |
| `te` | Open a new tab |
| `<tab>` / `<s-tab>` | Next / previous tab |
| `ss` / `sv` | Horizontal / vertical split |
| `sh` `sk` `sj` `sl` | Move between windows |
| `<leader>yf` / `<leader>yp` | Yank file path with line number (relative / absolute) |
| `<leader>cc` (visual) | Copy selection as a code block |
| `<leader>j` | Open `package.json` in floating window |
| `<leader>bd` | Delete hidden buffers |

### Files & pickers (Snacks)

| Key | Action |
| --- | --- |
| `sf` | Toggle file explorer (Oil) |
| `;f` | Find files |
| `;r` | Live grep |
| `;;` | Resume last picker |
| `\\` | List buffers (jumps to open window if visible) |
| `;e` | Diagnostics |
| `;n` | Notifications |
| `;g` | Lazygit |
| `;h` | Git diff (hunks) |
| `]]` / `[[` | Next / previous reference (Snacks words) |

### LSP

| Key | Action |
| --- | --- |
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gy` | Goto type definition |
| `gI` | Goto source definition (vtsls) / implementation |
| `gr` | References |
| `K` | Hover |
| `gK` / `<C-k>` (insert) | Signature help |
| `<C-j>` | Jump to next diagnostic |
| `<leader>ca` | Code action (n + x) |
| `<leader>cr` | Rename symbol |
| `<leader>cl` | LSP info |
| `<leader>cR` | Rename file |
| `<leader>f` | Format (n + x) |

### Git

| Key | Action |
| --- | --- |
| `<leader>gb` | Blame current line |
| `<leader>gB` | Blame buffer |
| `<leader>go` | Open file at blamed commit |
| `<leader>gs` | Toggle stage buffer |
| `<leader>gh` | Toggle stage hunk |
| `<leader>gd` | Toggle MiniDiff overlay |
| `<leader>dv` | Toggle CodeDiff |
| `<leader>dh` / `<leader>dH` | File history (current file / repo) |

## Verify

```powershell
nvim --headless "+qa" 2>&1
```

Or open `nvim` and run `:checkhealth`.

## Inspo

- [Effective Neovim Setup for Agentic Coding, Towards 2027](https://www.devas.life/effective-neovim-setup-for-agentic-coding-towards-2027/)
