vim.lsp.enable({ "clangd", "luals", "pyright", "rust-analyzer" })
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, { silent = true, desc = "Run formatter" })

vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

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

vim.cmd("set completeopt+=noselect")
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, { silent = true, desc = "Run formatter" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
