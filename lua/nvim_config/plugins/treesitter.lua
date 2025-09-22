return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query" }
        })
    end,
}
