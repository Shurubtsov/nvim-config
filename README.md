# Neovim Configuration

Modern, feature-rich Neovim configuration optimized for systems programming with strong LSP integration.

## Features

- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) with auto-installation and lazy loading
- **Dynamic Colorschemes:** 7 pre-installed themes with fuzzy picker and session persistence (Gruvbox, TokyoNight, Catppuccin, Kanagawa, Nightfox, Rose Pine, Dracula)
- **LSP Support:** Comprehensive language server configurations with auto-installation via mason.nvim
- **Fuzzy Finding:** Fast file/text search with [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- **Auto-completion:** Context-aware completion with nvim-cmp
- **Modern Syntax:** Tree-sitter powered syntax highlighting
- **Git Integration:** gitsigns, branch info, and lazygit integration
- **Terminal:** Floating terminal with toggleterm and pre-configured apps

## Supported Languages

| Language | LSP Server | Features |
|----------|------------|----------|
| **Go** | gopls | Auto-formatting (gofumpt), goimports, staticcheck |
| **Rust** | rust_analyzer | Proc macros, clippy integration |
| **Lua** | lua_ls | Neovim-aware configuration |
| **C/C++** | clangd | Formatting, diagnostics |
| **Zig** | zls | Full language support |
| **SQL** | sqlls | Query formatting |

## Prerequisites

### 1. Neovim

Requires Neovim >= 0.9.0

```bash
# Check your version
nvim --version
```

### 2. Nerd Fonts

Required for icons to display correctly.

**Recommended:** Agave Nerd Font

Visit [Nerd Fonts](https://www.nerdfonts.com/) to download.

**Installation (Linux):**
```bash
# Download a Nerd Font
# Unzip and copy to fonts directory
mkdir -p ~/.local/share/fonts
cp *.ttf ~/.local/share/fonts/

# Rebuild font cache
fc-cache -fv
```

### 3. External Tools

#### Required
- **ripgrep** - For fast text searching (fzf-lua dependency)
  ```bash
  # Ubuntu/Debian
  sudo apt-get install ripgrep

  # Arch/Manjaro
  sudo pacman -S ripgrep

  # macOS
  brew install ripgrep
  ```

- **fd** - For fast file finding (optional but recommended)
  ```bash
  # Ubuntu/Debian
  sudo apt-get install fd-find

  # Arch/Manjaro
  sudo pacman -S fd

  # macOS
  brew install fd
  ```

#### Optional (for enhanced features)
- **lazygit** - Git UI in terminal
- **node** - For some LSP servers
- **go** - For Go development
- **rust** - For Rust development

## Installation

1. **Backup existing configuration**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**
   ```bash
   git clone https://github.com/Shurubtsov/nvim-config ~/.config/nvim
   ```

3. **Launch Neovim**
   ```bash
   nvim
   ```

   lazy.nvim will automatically:
   - Install itself if not present
   - Install all plugins
   - Download LSP servers via mason.nvim

4. **Wait for installation to complete**
   - First launch may take a few minutes
   - Tree-sitter parsers will compile automatically

## Plugin Overview

### Core Functionality

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager with lazy loading |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |

### Colorschemes

| Plugin | Description |
|--------|-------------|
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Warm retro groove theme (default) |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Modern dark theme with multiple variants |
| [catppuccin](https://github.com/catppuccin/nvim) | Soothing pastel theme |
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Dark theme inspired by famous painting |
| [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) | Highly customizable theme family |
| [rose-pine](https://github.com/rose-pine/neovim) | Natural pine theme |
| [dracula.nvim](https://github.com/Mofiqul/dracula.nvim) | Classic dracula theme |

### UI Enhancement

| Plugin | Purpose |
|--------|---------|
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line with git/LSP info |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | Buffer tabs with git status |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Start screen |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | Code context breadcrumbs |

### Navigation

| Plugin | Purpose |
|--------|---------|
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder (files, text, LSP) |
| [hop.nvim](https://github.com/phaazon/hop.nvim) | Quick jump to any location |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |

### Development Tools

| Plugin | Purpose |
|--------|---------|
| [go.nvim](https://github.com/ray-x/go.nvim) | Enhanced Go development |
| [vim-go](https://github.com/fatih/vim-go) | Additional Go tooling |
| [zig.vim](https://github.com/ziglang/zig.vim) | Zig language support |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal integration |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |

### Utilities

| Plugin | Purpose |
|--------|---------|
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting |
| [mini.pairs](https://github.com/echasnovski/mini.nvim) | Auto-pair brackets |
| [focus.nvim](https://github.com/nvim-focus/focus.nvim) | Automatic window sizing |
| [nvim-cursorline](https://github.com/yamatsum/nvim-cursorline) | Highlight word under cursor |

## Key Mappings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<leader>w` | Save file |
| `Ctrl+b` | Close buffer |
| `Ctrl+d/u` | Page down/up (centered) |

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>o` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text) |
| `<leader>fr` | Find LSP implementations |
| `<leader>fc` | Colorscheme picker |
| `F` | Hop to line |

### Buffer Management
| Key | Action |
|-----|--------|
| `]b` | Next buffer |
| `[b` | Previous buffer |

### LSP Operations
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Show references |
| `K` | Hover documentation |
| `Ctrl+k` | Signature help |
| `<space>rn` | Rename symbol |
| `<space>ca` | Code action |
| `<space>f` | Format code |
| `<space>e` | Show diagnostic |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Go-specific
| Key | Action |
|-----|--------|
| `<leader>ef` | Find interface implementations |

### Window Management
| Key | Action |
|-----|--------|
| `<leader>h` | Split left |
| `<leader>j` | Split down |
| `<leader>k` | Split up |
| `<leader>l` | Split right |

### Terminal
| Key | Action |
|-----|--------|
| `Ctrl+\` | Toggle floating terminal |

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock
├── lua/
│   ├── options.lua         # Editor options
│   ├── keymaps.lua         # Global keybindings
│   ├── autocommands.lua    # Autocommands (includes colorscheme auto-save)
│   ├── package/
│   │   ├── lsp.lua        # LSP on_attach config
│   │   ├── colorscheme.lua # Colorscheme persistence utility
│   │   └── utils.lua      # Utility functions
│   └── plugins/
│       ├── init.lua       # Plugin definitions
│       ├── lspconfig.lua  # LSP server configs
│       ├── cmp.lua        # Completion setup
│       ├── treesitter.lua # Syntax highlighting
│       └── ...            # Other plugin configs
```

## Customization

### Change Colorscheme

This configuration includes **7 pre-installed colorschemes** with dynamic switching and session persistence.

**Quick Switch:**
- Press `<leader>fc` to open the colorscheme picker
- Use fuzzy search or arrow keys to browse
- Press Enter to apply
- Your choice is automatically saved and persists across sessions

**Available Themes:**
- `gruvbox` - Warm retro groove (default)
- `tokyonight-night` - Modern dark theme
- `catppuccin-mocha` - Soothing pastel theme
- `kanagawa` - Inspired by famous Japanese painting
- `nightfox` - Highly customizable dark theme
- `rose-pine` - Natural pine theme
- `dracula` - Classic dark theme

**Manual Change:**
```vim
:colorscheme tokyonight-night
```

**Add More Colorschemes:**

Edit `lua/plugins/init.lua` and add your preferred theme:
```lua
{ "author/colorscheme-name", lazy = false, priority = 1000 },
```

**Change Default Colorscheme:**

Edit `init.lua` line 28:
```lua
colorscheme_util.apply_colorscheme("your-theme-name")
```

### Add New LSP Server

1. Add to mason ensure_installed in `lua/plugins/init.lua`:
```lua
ensure_installed = { "lua_ls", "rust_analyzer", "your_new_lsp" }
```

2. Add configuration in `lua/plugins/lspconfig.lua`:
```lua
require("lspconfig").your_new_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
```

### Modify Keybindings

Edit `lua/keymaps.lua` for global mappings or `lua/package/lsp.lua` for LSP-specific mappings.

## Troubleshooting

### LSP not working
```vim
:Mason
```
Check if LSP servers are installed. Install manually if needed.

### Tree-sitter errors
```vim
:TSUpdate
```
Manually update Tree-sitter parsers.

### Plugin issues
```vim
:Lazy sync
```
Sync all plugins to latest versions.

### Clear cache and reinstall
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
nvim
```

## Credits

- Configuration maintained by [Danila Shurubtsov](https://github.com/Shurubtsov)
- Built on top of the amazing Neovim ecosystem

## License

Feel free to use this configuration as a starting point for your own setup.
