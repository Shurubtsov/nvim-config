# Nvim-config

My zero configurated neovim IDE layer

## Description

Config for `Neovim` with couple setups for some plugins.

## Pre-requesites

### Nerd fonts

For stable functionality of config need setup `Nerd fonts`
  - Recommended: `Hack Nerd`

Visit [This site](https://www.nerdfonts.com/) for download fonts.

Setup:

1.) Download a `Nerd Font`

2.) Unzip and copy to `~/.fonts`

3.) Run the command `fc-cache -fv` to manually rebuild the font cache


### Vim-go

This config setup for `vim-go-plugin`, so you need install it from git repo.

Example:

```bash
git clone https://github.com/fatih/vim-go.git ~/.local/share/nvim/site/pack/plugins/start/vim-go

```

### Ripgrep

Config use `telescope` plugin and he need suggested dependencies like a `ripgrep` for fastest find.

For installation visit this [Section](https://github.com/BurntSushi/ripgrep#installation)

I have Linux mint so command for me is `$ sudo apt-get install ripgrep`

## List of plugins

- Main plugins
  - lualine
  - bufferline
  - nvim-tree
  - telescope
  - nvim-lspconfig
  - cmp
  - hop
  - dashboard

