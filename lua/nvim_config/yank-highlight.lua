vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked area",
    group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
