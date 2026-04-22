vim.pack.add({{src = "https://github.com/nvim-treesitter/nvim-treesitter-context"}})

require("treesitter-context").setup({
    enable = true,
    mode = "topline",
    max_lines = 5,
    trim_scope = "inner",
})
