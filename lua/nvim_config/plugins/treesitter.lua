vim.pack.add({{src = "https://github.com/nvim-treesitter/nvim-treesitter"}})

require("nvim-treesitter").install({ "c", "cpp", "python", "rust", "lua" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "python", "rust", "lua" },
    callback = function() vim.treesitter.start() end,
})
