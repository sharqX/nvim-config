# 🚀 My Neovim Configuration

A carefully crafted Neovim configuration built for modern development workflows. This setup provides a powerful, efficient, and beautiful coding environment with intelligent completion, LSP support, and intuitive keybindings.

## ✨ Features

### 🎨 Visual & Theme
- **Lush Theme**: Custom colorscheme built with Lush.nvim
- **Mini.nvim Statusline**: Clean and informative status line with icons
- **Syntax Highlighting**: Advanced syntax highlighting powered by Treesitter
- **Indent Guides**: Rainbow indentation lines for better code structure via IBL
- **Mini Icons**: Consistent iconography throughout the interface

### 🔧 Core Functionality
- **LSP Integration**: Full Language Server Protocol support with auto-installation via Mason
- **Intelligent Completion**: Blink.cmp for fast, context-aware autocompletion with snippets
- **File Explorer**: Oil.nvim for intuitive, buffer-based file management
- **Fuzzy Finding**: Telescope for quick file and text searching across projects
- **Integrated Terminal**: ToggleTerm for seamless terminal access with PowerShell support
- **Git Integration**: Advanced git workflow with Fugitive and GitSigns

### 🛠️ Productivity
- **Treesitter**: Advanced syntax parsing and code understanding
- **Auto-formatting**: Consistent code formatting on save via native LSP
- **Code Actions**: Quick fixes and refactoring suggestions via LSP

### 🛠️ Language Support
Out-of-the-box support for:
- **Lua** (Neovim configuration)
- **Vim Script** (via vimls)
- **Bash/Shell scripting**
- **C/C++** (via clangd)
- **CSS/HTML** (web development)
- **Docker** (containers and compose)
- **Go** (backend development)
- **Helm** (Kubernetes charts)
- **JSON/YAML** (configuration files)
- **Python** (via pyright)
- **Terraform** (infrastructure as code)
- **TypeScript/JavaScript** (via ts_ls)

## 📋 Prerequisites

- **Neovim** >= 0.10.0 (recommended: latest stable)
- **Git** (for plugin management and version control)
- **Node.js** >= 16.0 (for TypeScript/JavaScript LSP servers)
- **Python** >= 3.8 (for Python LSP support)
- **PowerShell** (Windows) or your preferred shell
- A **Nerd Font** (required for icons - recommended: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/))

## 🚀 Installation

### Windows
1. **Navigate to your Neovim config directory:**
   ```powershell
   cd $env:LOCALAPPDATA\nvim
   ```

2. **Clone this configuration:**
   ```powershell
   git clone https://github.com/sharqX/nvim-config.git .
   ```

3. **Start Neovim:**
   ```powershell
   nvim
   ```

### Linux/macOS
1. **Navigate to your Neovim config directory:**
   ```bash
   cd ~/.config/nvim
   ```

2. **Clone this configuration:**
   ```bash
   git clone https://github.com/sharqX/nvim-config.git .
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

On first startup, Lazy.nvim will automatically install all plugins and Mason will set up the language servers.

## ⚡ Key Bindings

### Leader Key
- **Leader**: `<Space>`

### Essential Shortcuts
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>ff` | Find Files | Open Telescope file finder |
| `<leader>fg` | Live Grep | Search text across project |
| `<leader>e` | File Explorer | Open Oil.nvim file browser |
| `<leader>w` | Save | Write current buffer |
| `<leader>q` | Quit | Close current window |
| `<leader>h` | Clear Search | Remove search highlighting |
| `<C-\>` | Toggle Terminal | Open/close integrated terminal |
| `<Esc>` | Exit Terminal Mode | Return to normal mode from terminal |
| `<C-f>` | Format | Format current buffer with LSP |

### Git Integration
- **Fugitive**: Full git workflow integration
- **GitSigns**: Inline git change indicators and hunks

### Built-in Neovim
- **Normal Mode**: Navigate and edit efficiently
- **Visual Mode**: Select and manipulate text blocks
- **Insert Mode**: Type and edit text
- **Command Mode**: Execute Neovim commands

## 📁 Project Structure

```
📁 nvim/
├── 📄 init.lua              # Main configuration entry point
├── 📄 lazy-lock.json        # Plugin version lockfile
├── 📁 lua/
│   ├── 📁 config/
│   │   └── 📄 lazy.lua      # Lazy.nvim plugin manager + theme setup
│   ├── 📁 plugins/
│   │   ├── 📄 cmp.lua       # Blink.cmp completion configuration
│   │   ├── 📄 git-conf.lua  # Git integration (Fugitive + GitSigns)
│   │   ├── 📄 indent-blankline.lua # Rainbow indentation guides (IBL)
│   │   ├── 📄 lsp.lua       # Language Server Protocol + Mason
│   │   ├── 📄 mini.lua      # Mini.nvim modules (statusline, icons)
│   │   ├── 📄 oil.lua       # File explorer configuration
│   │   ├── 📄 remap.lua     # Custom keybindings
│   │   ├── 📄 telescope.lua # Fuzzy finder setup
│   │   ├── 📄 terminal.lua  # ToggleTerm configuration
│   │   └── 📄 treesitter.lua # Syntax highlighting
│   └── 📁 theme/
│       └── 📄 myLushTheme.lua # Custom Lush theme
└── 📄 README.md             # This documentation
```

## 🔧 Customization

### Adding New Language Servers
Edit `lua/plugins/lsp.lua` and add your desired language server to the `ensure_installed` table:

```lua
ensure_installed = {
  "lua_ls",
  "your_new_server", -- Add here
  -- ... other servers
},
```

### Modifying Theme
The custom Lush theme can be modified in `lua/theme/myLushTheme.lua`. The theme is applied via `lua/config/lazy.lua` using the Lush.nvim framework.

### Adding Custom Keybindings
Create or modify keybindings in `lua/plugins/remap.lua` or within individual plugin configurations.

## 🛠️ Plugin Management

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management:

- **Update plugins**: `:Lazy update`
- **Install plugins**: `:Lazy install`
- **Plugin status**: `:Lazy`
- **Clean unused**: `:Lazy clean`

### Getting Help
- Check `:checkhealth` for configuration issues
- Review plugin documentation for specific features
- Check the Neovim documentation with `:help`

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have improvements or bug fixes:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

Built with amazing plugins from the Neovim community:
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [Lush.nvim](https://github.com/rktjmp/lush.nvim) - Colorscheme creation framework
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder and picker
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Advanced syntax highlighting
- [Mason](https://github.com/williamboman/mason.nvim) - LSP/formatter installer
- [Blink.cmp](https://github.com/saghen/blink.cmp) - Fast completion engine
- [Oil.nvim](https://github.com/stevearc/oil.nvim) - File explorer as a buffer
- [Mini.nvim](https://github.com/echasnovski/mini.nvim) - Swiss Army knife collection
- [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) - Terminal integration
- [Fugitive](https://github.com/tpope/vim-fugitive) - Git workflow
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim) - Git change indicators
- [IBL](https://github.com/lukas-reineke/indent-blankline.nvim) - Indentation guides

---

*Happy coding! 🎉*
