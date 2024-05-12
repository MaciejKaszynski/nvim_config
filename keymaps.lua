vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- Whoa
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<F12>", ":set rnu!<CR>", {silent=true})
vim.keymap.set("n", "<F5>", ":set spell<CR>", {silent=true})
