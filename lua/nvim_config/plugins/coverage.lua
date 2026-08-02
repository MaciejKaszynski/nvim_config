vim.pack.add({ { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/andythigpen/nvim-coverage" } })

require("coverage").setup({
    auto_reload = true,
    signs = {
        covered = { hl = "CoverageCovered", text = "█" },
        uncovered = { hl = "CoverageUncovered", text = "█" },
        partial = { hl = "CoveragePartial", text = "█" },
    },
    lang = {
        cpp = {
            coverage_file = "bazel-out/_coverage/_coverage_report.dat",
        },
    },
})
