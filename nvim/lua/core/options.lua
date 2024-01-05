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

cmd([[hi link VirtualTextError Red]])
cmd([[hi link VirtualTextWarning Yellow]])

opt.list = true
opt.listchars = {
	nbsp = "-",
	trail = "-",
	tab = "> ",
}

-- Indentation for special languages
local two_space_languages = {
	"javascript",
	"javascriptreact",
	"json",
	"svelte",
	"typescript",
	"typescriptreact",
	"html",
	"css",
	"ocaml",
	"elixir",
	"rescript",
}
api.nvim_create_autocmd("FileType", {
	pattern = two_space_languages,
	callback = function()
		opt.shiftwidth = 2
		opt.tabstop = 2
		opt.softtabstop = 2
	end,
})
