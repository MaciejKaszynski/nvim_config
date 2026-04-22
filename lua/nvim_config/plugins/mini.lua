vim.pack.add({{src = "https://github.com/nvim-mini/mini.nvim"}})

require("mini.icons").setup()
require("mini.notify").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.statusline").setup()
require("mini.diff").setup({ view = { style = "sign" } })


-- mini files
local mini_files = require("mini.files")
mini_files.setup({
    options = {
        use_as_default_explorer = true,
    },
})

vim.keymap.set("n", "<leader>fe", mini_files.open)
