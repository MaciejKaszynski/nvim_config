return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
    settings = {
        -- Fix the VFS issue by configuring the check command
        checkOnSave = {
            command = "check", -- Use 'check' instead of default 'clippy'
            extraArgs = { "--target-dir", "/tmp/rust-analyzer-check" }, -- Use a consistent path
        },
        -- Load standard library sources correctly
        cargo = {
            loadOutDirsFromCheck = true,
            buildScripts = {
                enable = true,
            },
        },
        -- Properly use procMacro
        procMacro = {
            enable = true,
        },
    },
}
