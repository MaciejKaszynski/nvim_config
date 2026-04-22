vim.pack.add({
    {src = "https://github.com/nvim-lua/plenary.nvim"},
    {src = "https://github.com/nvim-telescope/telescope.nvim"},
    {src = "https://github.com/NeogitOrg/neogit" },
    {src = "https://github.com/sindrets/diffview.nvim"}
})

vim.keymap.set("n",
    "<leader>G",
    function()
        require("neogit").open({ kind = "floating" })
    end
)
