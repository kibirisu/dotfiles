-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.clipboard = "unnamedplus"

vim.opt.termguicolors = true

-- nvim.tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup("plugins")
vim.cmd.colorscheme('catppuccin-mocha')
require("telescope").load_extension "file_browser"
