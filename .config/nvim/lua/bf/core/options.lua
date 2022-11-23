local opt = vim.opt

-- line
opt.relativenumber = true
opt.number = true
opt.cursorline = true 
opt.scrolloff = 7

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- remove docs after enter
vim.cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o")

-- delete swap file
opt.swapfile = false

-- encodings
opt.fileformat = "unix"
opt.encoding = "utf-8"
