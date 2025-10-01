vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.wo.relativenumber = true

-- Load Leader Key --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load Lazy --
require("config.lazy")

