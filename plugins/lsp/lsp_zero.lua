return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason").setup()

        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "clangd" },
            handlers = {
                lsp_zero.default_setup,
            },
        })

        local lspconfig = require("lspconfig")

        lspconfig.pyright.setup({})
        lspconfig.clangd.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = {
                            "vim",
                            "require",
                        },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    end,
}
