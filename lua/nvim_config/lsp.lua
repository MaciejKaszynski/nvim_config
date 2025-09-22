-- Configs for window
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {current_line = true},
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    underline = true,
    update_in_insert = false,
})

vim.lsp.enable({ "clangd", "luals", "pyright", "rust-analyzer" })
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {silent = true, desc = "Run formatter"})
