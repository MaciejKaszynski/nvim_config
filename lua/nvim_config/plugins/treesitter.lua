vim.pack.add({{src = "https://github.com/nvim-treesitter/nvim-treesitter"}})

require("nvim-treesitter.config").setup({
    ensure_installed = { "cpp", "python", "rust" },
    highlight = {enable = true}
})
