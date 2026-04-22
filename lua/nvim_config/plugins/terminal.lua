vim.pack.add({{src = "https://github.com/akinsho/toggleterm.nvim"}})

require("toggleterm").setup()

vim.keymap.set({"n"}, "<C-t>", ":ToggleTerm direction=float<CR>")
vim.keymap.set({"t"}, "<C-t>", "<C-\\><C-n>:ToggleTerm direction=float<CR>")
