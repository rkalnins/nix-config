

local cmd = vim.cmd
local o = vim.opt

o.termguicolors = true
o.background = "dark"
cmd([[colorscheme gruvbox]])

o.scrolloff = 10
o.linebreak = true
o.autowrite = true
o.backspace = "indent,eol,start"
o.encoding = "utf-8"
o.viewoptions = "folds,options,cursor,unix,slash"

o.number = true
o.relativenumber = true

local tabWidth = 4

o.expandtab = true
o.laststatus = tabWidth
o.tabstop = tabWidth
o.softtabstop = tabWidth
o.shiftwidth = tabWidth

o.completeopt = "menuone,noselect"
