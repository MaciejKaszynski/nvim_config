return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        ls.setup({
            keep_roots = true,
            link_roots = true,
            link_children = true,

            -- Update more often, :h events for more info.
            update_events = "TextChanged,TextChangedI",
        })

        vim.keymap.set({ "i", "s" }, "<C-L>", function()
            ls.jump(1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function()
            ls.jump(-1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })


        require("luasnip.loaders.from_vscode").load({paths = vim.fn.expand("$HOME/.config/snippets")})

    end,
}
