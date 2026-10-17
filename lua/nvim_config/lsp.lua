vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

vim.lsp.enable({ "clangd", "luals", "pyright", "rust_analyzer", "ruff", "cmake", "graph-visualizer",
    "jsonls", "bashls", "yamlls", "marksman", "taplo" })

vim.o.winborder = "rounded"
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true },
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

vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, { silent = true, desc = "Run formatter" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })


-- code lenses
vim.lsp.codelens.enable(false)
vim.keymap.set("n", "<leader>cl", function()
    local code_lens_enabled = vim.lsp.codelens.is_enabled()
    vim.lsp.codelens.enable(not code_lens_enabled)
end)

-- hints
vim.lsp.inlay_hint.enable(true)

-- commands
vim.keymap.set("n", "<leader>lc", function()
    local client = vim.lsp.get_clients({
        bufnr = 0,
        method =
        "workspace/executeCommand"
    })[1]
    local cmds = client and
        client.server_capabilities.executeCommandProvider
        and client.server_capabilities.executeCommandProvider.commands
    if not cmds or #cmds == 0 then
        return vim.notify("No LSP commands", vim.log.levels.INFO)
    end
    vim.ui.select(cmds, { prompt = "LSP command" }, function(cmd)
        if cmd then
            client:exec_cmd({ title = cmd, command = cmd }, {
                bufnr = 0 })
        end
    end)
end, { desc = "Run an LSP command" })
