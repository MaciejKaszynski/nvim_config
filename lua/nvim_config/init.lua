vim.g.mapleader = " "
require("nvim_config.keymaps")
require("nvim_config.options")
require("nvim_config.lsp")
require("nvim_config.plugins")
require("nvim_config.yank-highlight")
require("nvim_config.yank")

if vim.g.neovide then
    require("nvim_config.neovide")
end
