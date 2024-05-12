return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query" },
			sync_install = false,

			auto_install = true,

			ignore_install = { "javascript" },
			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
