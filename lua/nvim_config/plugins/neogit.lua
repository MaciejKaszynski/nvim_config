return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
        {
            "<leader>G",
            function()
                require("neogit").open({ kind = "floating" })
            end,
            desc = "Open neogit.",
        },
    },
}
