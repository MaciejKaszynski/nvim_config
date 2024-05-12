return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                json = { "fixjson" },
                cpp = { "clang-format" },
                ["*"] = { "codespell" },
            },
        })
        conform.formatters.stylua = {
            prepend_args = function(self, ctx)
                return { "--indent-type", "Spaces" }
            end,
        }
        vim.keymap.set("n", "<leader>pf", function()
            conform.format()
        end)
    end,
}
