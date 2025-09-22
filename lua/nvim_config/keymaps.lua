-- Whoa
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>tr", ":set rnu!<CR>", { silent = true })
vim.keymap.set("n", "<leader>rs", ":set spell<CR>", { silent = true })

vim.keymap.set("n", "<F1>", "")

vim.keymap.set("n", "<leader><leader>l", ":so $MYVIMRC<CR>", { silent = true })
