return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "mfussenegger/nvim-dap",
        "williamboman/mason.nvim",
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "nvim-neotest/nvim-nio",
            },
        },
    },
    config = function()
        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb" },
            automatic_installation = true,
        })

        local dap = require("dap")
        local dapui = require("dapui")

        -- Open dapui if debugging session starts
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        -- Open dapui if debugging sessions ends
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        -- Is this used?
        dap.listeners.before.event_exited["dapui_config"] = function() end

        -- what the fuck
        dap.adapters.cpp = {
            type = "executable",
            attach = {
                pidProperty = "pid",
                pidSelect = "ask",
            },
            command = "lldb-vscode",
            env = {
                LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
            },
            name = "lldb",
        }

        -- ok?
        dap.configurations.python = {
            type = "python",
            request = "launch",
            name = "My custom launch configuration",
            program = "${file}",
        }
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "cpp",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                env = function()
                    local variables = {}
                    for k, v in pairs(vim.fn.environ()) do
                        table.insert(variables, string.format("%s=%s", k, v))
                    end
                    return variables
                end,
                stopOnEntry = false,
                args = {},
            },
        }

        vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<CR>")
        vim.keymap.set("n", "<leader>bp", ":lua require('dap').toggle_breakpoint()<CR>")
    end,
}
