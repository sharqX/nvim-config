# AGENTS.md

Personal Neovim config (Windows/PowerShell). No build, test, or CI pipeline — verification is launching `nvim` and watching for errors.

## Verify changes
- Load config headless, check for errors: `nvim --headless "+qa" 2>&1`
- Interactive health check: `:checkhealth`
- Mason-installed tools live in `%LOCALAPPDATA%\nvim-data\mason\packages`.

## Architecture
- Plugin manager is **built-in `vim.pack`**, not lazy.nvim. Plugins are declared in `lua/craftzdog/plugins/init.lua` via `vim.pack.add({...})`. `nvim-pack-lock.json` is generated and gitignored — never hand-edit it.
- Add a plugin by appending `{ src = gh("owner/repo") }` (optional `version = ...`); `gh()` is a global helper defined at the top of that file.
- Load order (see `init.lua`): options → keymaps → autocmds → commands → workarounds → plugins. `craftzdog.plugins` requires `ui`, `treesitter`, `editor`, `lsp`, `util`, `keymaps` in that order.
- Module namespace is `craftzdog` (not the repo/dir name). `_G.Craftzdog = require("craftzdog.utils")` exposes `icons`, `lualine`, `tabline`, `editor` to plugin setup files.
- Machine-local overrides go in `lua/craftzdog/plugins/local.lua` — auto-required only if the file exists.

## LSP
- Uses Neovim 0.11+ `vim.lsp.config` / `vim.lsp.enable` (see `plugins/lsp.lua`). Do **not** use `lspconfig.setup()`.
- Per-server overrides are `return { ... }` tables in `after/lsp/<server>.lua` (`lua_ls`, `vtsls`, `cssls`, `oxlint`).
- `mason-tool-installer`'s `ensure_installed` list in `plugins/lsp.lua` is the source of truth for installed tools (`auto_update = false`).

## Formatting
- `conform.nvim` (`plugins/editor.lua`). Web files try `oxfmt → prettierd → prettier`, but `oxfmt` is skipped unless the project has `.oxfmtrc.json(c)` (`require_cwd = true`). `lua` = stylua, `sh` = shfmt, `fish` = fish_indent.
- Format-on-save is disabled per-buffer via `vim.b.disable_autoformat`; toggle with `:ToggleFormatter`.

## Conventions & gotchas
- Lua source files are **tab-indented** (stylua defaults) even though the editor sets `expandtab`, `shiftwidth=2`.
- Leader is `space`. Keymaps in `plugins/keymaps.lua` use a custom `map({ {lhs, rhs, ...} })` table helper.
- Windows-specific branches exist in `treesitter.lua` (sets `CC=gcc` when `cl.exe` missing) and `utils/lazygit.lua` (cmd.exe path for `os.edit`). Preserve both platform branches.
- MDX has no parser: `treesitter.lua` registers it to the `markdown` parser.
- `config/workarounds.lua` patches an upstream treesitter fold bug dependently; don't remove without checking the referenced issue.
