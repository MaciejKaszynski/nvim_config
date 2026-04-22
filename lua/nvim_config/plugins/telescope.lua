vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" } })


local builtin = require("telescope.builtin")
local opts = { silent = true }

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.git_files, opts)
vim.keymap.set("n", "<leader>fs", builtin.live_grep, opts)

vim.keymap.set("n", "<leader>lh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>lm", builtin.marks, opts)
vim.keymap.set("n", "<leader>lb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, opts)
vim.keymap.set("n", "<leader>fh", builtin.current_buffer_fuzzy_find, opts)
