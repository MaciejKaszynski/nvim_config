vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>tr", ":set rnu!<CR>", { silent = true })
vim.keymap.set("n", "<leader>rs", ":set spell<CR>", { silent = true })

vim.keymap.set("n", "<F1>", "")

vim.keymap.set("n", "<leader><leader>l", ":so $MYVIMRC<CR>", { silent = true })


local function date_to_iso(s)
    local cmds = {
        { "date", "-j", "-f", "%B %d, %Y", s, "+%F" },
        { "date", "-j", "-f", "%b %d, %Y", s, "+%F" },
        { "date", "-j", "-f", "%d %B %Y",  s, "+%F" },
        { "date", "-j", "-f", "%d %b %Y",  s, "+%F" },
        { "date", "-d", s, "+%F" },
    }
    for _, cmd in ipairs(cmds) do
        local r = vim.system(cmd):wait()
        if r.code == 0 then return vim.trim(r.stdout) end
    end
end

vim.keymap.set("x", "<leader>di", function()
    local mode = vim.fn.mode()
    local p1, p2 = vim.fn.getpos("v"), vim.fn.getpos(".")
    local text = vim.trim(table.concat(vim.fn.getregion(p1, p2, { type = mode }), " "))
    local iso = date_to_iso(text)
    if not iso then
        vim.notify("Could not parse date: " .. text, vim.log.levels.WARN)
        return
    end
    local regions = vim.fn.getregionpos(p1, p2, { type = mode })
    local s, e = regions[1][1], regions[#regions][2]
    vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
    vim.api.nvim_buf_set_text(0, s[2] - 1, s[3] - 1, e[2] - 1, e[3], { iso })
end, { desc = "Selected date -> YYYY-MM-DD" })
