vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.wo.relativenumber = true

-- Load Leader Key --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load Mason Bin to PATH --
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (vim.fn.has("win32") == 1 and ";" or ":") .. vim.env.PATH

-- Load Lazy --
require("config.lazy")
