vim.pack.add({{src = "https://github.com/nvim-mini/mini.nvim"}})

require("mini.icons").setup()
require("mini.notify").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.statusline").setup()

local mini_files = require("mini.files")
mini_files.setup({
    options = {
        use_as_default_explorer = true,
    },
})

vim.keymap.set("n", "<leader>fe", function()
    mini_files.open(vim.api.nvim_buf_get_name(0), false)
    mini_files.reveal_cwd()
end, { desc = "Open mini.files rooted at cwd, revealing current file" })
