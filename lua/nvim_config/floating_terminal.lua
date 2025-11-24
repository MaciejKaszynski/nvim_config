local state = {
    {
        buf = -1,
        win = -1,
        active = false,
    }
}

local function create_floating_window(opts)
    opts = opts or {}

    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - width) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("FT", function(opts)
    local index = tonumber(opts.args)
    if not index then
        return
    end

    -- create a state object if not already created.
    local current_state = state[index]
    if current_state == nil then
        current_state = { buf =-1, win = -1, job_id = -1, active = false }
    end

    if not vim.api.nvim_win_is_valid(current_state.win) then
        state[index] = create_floating_window(current_state)
        state[index].active = true
        if vim.bo[state[index].buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.api.nvim_feedkeys("A", "n", false)
    else
        state[index].active = false
        vim.api.nvim_win_hide(current_state.win)
    end

    end,
    {
        nargs = 1,
        desc = "asd"
    }
)

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-N>", {silent = true})
vim.keymap.set('n', "<leader>tt", ":FT 1<CR>", {silent = true})
vim.keymap.set('n', "<leader>tm", function ()
    local job_id = vim.bo[state[1].buf].channel
    if not job_id then
        print("job id invalid!!!")
    end

    vim.fn.chansend(job_id, {"\003cmake --build build\r\n"})
end, {silent = true})
vim.keymap.set('n', "<leader>tc", function ()
    local job_id = vim.bo[state[1].buf].channel
    if not job_id then
        print("job id invalid!!!")
    end

    vim.fn.chansend(job_id, {"\003ctest --test-dir build\r\n"})
end, {silent = true})
vim.keymap.set('n', "<leader>t1", ":FT 1<CR>", {silent = true})
vim.keymap.set('n', "<leader>t2", ":FT 2<CR>", {silent = true})
