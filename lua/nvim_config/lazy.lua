--[[
Bootstrap for Lazy plugin manager
]]
--

if vim.fn.has("nvim-0.8") then
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

require("lazy").setup({
    { import = "nvim_config.plugins" },
    { import = "nvim_config.plugins.colourschemes" },
})
