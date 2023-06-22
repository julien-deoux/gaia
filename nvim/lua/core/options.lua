local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

g.mapleader = " "

-- Line numbers
opt.nu = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Scrolling margin
opt.scrolloff = 8

-- Color columns
opt.colorcolumn = "80"

-- Don't split words with dash (for cw and such)
opt.iskeyword:append("-")

cmd [[hi link VirtualTextError Red]]
cmd [[hi link VirtualTextWarning Yellow]]

opt.list = true
opt.listchars = "nbsp:-"
