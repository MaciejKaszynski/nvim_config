vim.pack.add({{src="https://github.com/MaciejKaszynski/bazel-target-picker.nvim"}})

local picker = require("bazel-target-picker")
picker.setup()

--- @param cmd string
local function run(cmd)
    require("toggleterm").exec(cmd, nil, nil, nil, "float")
end

--- Terminal:send/exec always appends a newline (executes immediately), so
--- bypass it and chansend directly to paste without running.
--- @param cmd string
local function send(cmd)
    local terms = require("toggleterm.terminal")
    local term = terms.get_or_create_term(terms.get_toggled_id(), nil, "float", nil)
    if not term:is_open() then term:open(nil, "float") end
    vim.fn.chansend(term.job_id, cmd)
    term:focus()
end

-- For coverage picks, chain genhtml onto the same command (only runs after
-- `bazel coverage` finishes) against the combined report Bazel always
-- writes to bazel-out/_coverage/_coverage_report.dat.
--- @param result PickResult
--- @return string
local function final_cmd(result)
    if result.target_type == "coverage" then
        return result.cmd .. " && genhtml bazel-out/_coverage/_coverage_report.dat --output-directory _build/coverage"
    end
    return result.cmd
end

vim.keymap.set("n", "<leader>bb", function()
    picker.pick_verbose_from_buffer(function(result) run(final_cmd(result)) end)
end, { desc = "Pick a Bazel target and run it" })

vim.keymap.set("n", "<leader>bl", function()
    picker.pick_verbose_from_buffer(function(result) send(final_cmd(result)) end)
end, { desc = "Pick a Bazel target and paste it" })

vim.keymap.set("n", "<leader>ba", function()
    picker.pick_all(function(result) run(final_cmd(result)) end)
end, { desc = "Pick a Bazel target and paste it" })
