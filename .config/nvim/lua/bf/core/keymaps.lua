vim.g.mapleader = " "

local km = vim.keymap

km.set("i", "jk", "<ESC>")

km.set("n", "<leader>,", ":nohlsearch<CR>") 

km.set("n", "<leader>=", "<C-a>")
km.set("n", "<leader>-", "<C-x>")

-- vim-tree keys
km.set("n", "<leader>e", ":NvimTreeToggle<CR>")
km.set("n", "<leader>f", ":NvimTreeFocus<CR>")




