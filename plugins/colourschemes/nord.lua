return {
    "shaunsingh/nord.nvim",
    cond = false,
    config = function()
        require("nord").set()
        vim.cmd("colorscheme rose-pine-moon")
    end,
}
