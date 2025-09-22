return {
    'nvim-mini/mini.nvim',
    version = '*',

    config = function()

        require("mini.icons").setup()
        require("mini.comment").setup()
        require("mini.cursorword").setup()

        -- mini files
        local mini_files = require("mini.files")
        mini_files.setup({
            options = {
                use_as_default_explorer = true,
            },
        })

        vim.keymap.set("n", "<leader>fe", mini_files.open)


        -- mini animate
        -- local animate = require("mini.animate")
        -- animate.setup({
        --     cursor = {
        --         timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        --     },
        --     scroll = {
        --         timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        --     },
        --     resize = {
        --         timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        --     },
        --     open = {
        --         timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        --     },
        --     close = {
        --         timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        --     },
        -- })

        require("mini.statusline").setup()

        require("mini.diff").setup({ view = { style = "sign" } })
    end
}
