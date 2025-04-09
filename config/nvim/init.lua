-- Enable true colors for better visuals
vim.opt.termguicolors = true

-- Install Packer (Plugin Manager) if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd('!git clone --depth 1 https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd 'packadd packer.nvim'
end

-- Load Plugins (Only lightweight ones)
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"  -- Plugin manager
  use "EdenEast/nightfox.nvim"  -- Cool lightweight theme
  use "nvim-lualine/lualine.nvim"  -- Minimal status bar
  use "neovim/nvim-lspconfig"  -- Lightweight LSP (for Python autocompletion)
  use "hrsh7th/nvim-cmp"  -- Fast autocompletion
  use "hrsh7th/cmp-nvim-lsp"  -- LSP source for nvim-cmp
end)

-- Set Colorscheme (Nightlight Transparent)
vim.cmd("colorscheme dawnfox")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Transparent background
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

-- Status Bar (Minimal)
require("lualine").setup {
  options = { theme = "nightfox" }
}

-- Python Autocompletion (LSP)
require("lspconfig").pyright.setup{}  -- Lightweight Python LSP

-- Autocomplete Setup
local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(),  -- Navigate to the next completion item
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),  -- Navigate to the previous completion item
    ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm and insert the selected item
  },
  sources = {
    { name = "nvim_lsp" },  -- Use LSP source for autocompletion
  }
})

-- Basic UI Tweaks
vim.opt.number = true  -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers (useful for navigating)
vim.opt.cursorline = true  -- Highlight the current line
vim.opt.mouse = "a"  -- Enable mouse support
vim.opt.clipboard = "unnamedplus"  -- Use the system clipboard
vim.opt.showmode = false  -- Don't show mode in the command line (redundant with statusline)
vim.opt.tabstop = 4  -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4  -- Set indentation width to 4 spaces
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.wrap = false  -- Don't wrap long lines
vim.opt.scrolloff = 10  -- Keep 10 lines above/below the cursor while scrolling


