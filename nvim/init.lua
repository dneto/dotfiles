-- Setup lazyvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

-- Loading Plugins
require("lazy").setup("plugins")
require('options')
require('keybindings')
require('lualine-config')

-- Load colorscheme
vim.cmd.colorscheme "catppuccin"
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
