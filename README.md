# 🚀 Modern Neovim Configuration

A carefully crafted Neovim configuration built for modern development workflows. This setup provides a powerful, efficient, and beautiful coding environment with intelligent completion, LSP support, and intuitive keybindings.

## ✨ Features

### 🎨 Visual & Theme
- **Catppuccin Theme**: Beautiful, modern colorscheme with automatic light/dark mode switching
- **Mini.nvim Statusline**: Clean and informative status line with icons
- **Syntax Highlighting**: Advanced syntax highlighting powered by Treesitter

### 🔧 Core Functionality
- **LSP Integration**: Full Language Server Protocol support with auto-installation
- **Intelligent Completion**: Blink.cmp for fast, context-aware autocompletion
- **File Explorer**: Oil.nvim for intuitive file management
- **Fuzzy Finding**: Telescope for quick file and text searching
- **Git Integration**: Built-in git configuration and tools

### 🤖 AI & Productivity
- **GitHub Copilot**: AI-powered code suggestions and completion
- **Treesitter**: Advanced syntax parsing and code understanding
- **Auto-formatting**: Consistent code formatting across languages

### 🛠️ Language Support
Out-of-the-box support for:
- **Lua** (Neovim configuration)
- **Bash/Shell scripting**
- **C/C++** (via clangd)
- **CSS/HTML** (web development)
- **Docker** (containers and compose)
- **Go** (backend development)
- **Helm** (Kubernetes charts)
- **JSON/YAML** (configuration files)
- **Python** (data science & backend)
- **Terraform** (infrastructure as code)
- **TypeScript/JavaScript** (frontend development)

## 📋 Prerequisites

- **Neovim** >= 0.10.0
- **Git** (for plugin management)
- **Node.js** (for some LSP servers)
- **Python** (for Python LSP support)
- A **Nerd Font** (for icons - recommended: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/))

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
| `<leader>-ce` | Enable Copilot | Activate GitHub Copilot |
| `<leader>-cd` | Disable Copilot | Deactivate GitHub Copilot |

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
│   │   └── 📄 lazy.lua      # Lazy.nvim plugin manager setup
│   └── 📁 plugins/
│       ├── 📄 cmp.lua       # Completion configuration
│       ├── 📄 copilot.lua   # GitHub Copilot setup
│       ├── 📄 git-conf.lua  # Git integration
│       ├── 📄 lsp.lua       # Language Server Protocol
│       ├── 📄 mini.lua      # Mini.nvim modules
│       ├── 📄 oil.lua       # File explorer
│       ├── 📄 remap.lua     # Custom keybindings
│       ├── 📄 statusline.lua # Status line configuration
│       ├── 📄 telescope.lua # Fuzzy finder
│       └── 📄 treesitter.lua # Syntax highlighting
└── 📄 README.md             # This file
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
The Catppuccin theme can be customized in `lua/config/lazy.lua`. Available flavors:
- `latte` (light)
- `frappe` (dark)
- `macchiato` (dark)
- `mocha` (dark, default)

### Adding Custom Keybindings
Create or modify keybindings in `lua/plugins/remap.lua` or within individual plugin configurations.

## 🛠️ Plugin Management

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management:

- **Update plugins**: `:Lazy update`
- **Install plugins**: `:Lazy install`
- **Plugin status**: `:Lazy`
- **Clean unused**: `:Lazy clean`

## 🐛 Troubleshooting

### Common Issues

1. **LSP not working**: Ensure Mason has installed the language servers (`:Mason`)
2. **Icons not displaying**: Install a Nerd Font and configure your terminal
3. **Slow startup**: Check for plugin conflicts or network issues
4. **Copilot not working**: Verify GitHub Copilot subscription and authentication

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
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [Catppuccin](https://github.com/catppuccin/nvim) - Beautiful theme
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [Mason](https://github.com/williamboman/mason.nvim) - LSP installer
- [Blink.cmp](https://github.com/saghen/blink.cmp) - Completion engine
- [Oil.nvim](https://github.com/stevearc/oil.nvim) - File explorer
- [Mini.nvim](https://github.com/echasnovski/mini.nvim) - Swiss Army knife

---

*Happy coding! 🎉*