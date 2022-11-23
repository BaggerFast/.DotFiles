-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)

    use("wbthomason/packer.nvim")
    use("bluz71/vim-nightfly-guicolors") 
    use("nvim-lua/plenary.nvim")
    
    -- commenting with gc
    use("numToStr/Comment.nvim")
    
    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    
    -- vs-code like icons
    use("nvim-tree/nvim-web-devicons")
    
    -- statusline
    use("nvim-lualine/lualine.nvim")
    
    -- autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin  
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths
    
    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
        end,
    })

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
    
    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    if packer_bootstrap then
        require("packer").sync()
    end
end)
