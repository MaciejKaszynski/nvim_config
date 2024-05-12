return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                -- Navigation
                map("n", "]g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]g", bang = true })
                    else
                        gitsigns.next_hunk()
                    end
                end)

                map("n", "[g", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[g", bang = true })
                    else
                        gitsigns.prev_hunk()
                    end
                end)

                -- Actions
                map("n", "<leader>gp", gitsigns.preview_hunk)
                map("n", "<leader>gb", function()
                    gitsigns.blame_line({ full = true })
                end)
            end,
        })
    end,
    priority = 0,
}
