vim.pack.add({ { src = "https://github.com/nvim-mini/mini.nvim" } })

require("mini.icons").setup()
require("mini.notify").setup({
    lsp_progress = { enable = false },
})
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.statusline").setup()

-- git gutters
local mini_diff = require("mini.diff")
mini_diff.setup({ view = { style = "sign" } })

-- mini files
local mini_files = require("mini.files")
mini_files.setup({
    options = {
        use_as_default_explorer = true,
    },
})

-- follow the file mode (a bit broken on wsl)
local follow_current_file = true

vim.keymap.set("n", "<leader>fe", function()
    if not follow_current_file then
        return mini_files.open()
    end

    -- type: string?
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" or vim.fn.filereadable(path) == 0 then
        path = nil
    end
    mini_files.open(path, false)
end, { desc = "Open mini.files" })

vim.api.nvim_create_user_command("FEModeToggle", function()
    follow_current_file = not follow_current_file
    vim.notify("mini.files: " .. (follow_current_file and "follow current file" or "default (cwd / last state)"))
end, { desc = "Toggle mini.files between following the current file and default behaviour" })
