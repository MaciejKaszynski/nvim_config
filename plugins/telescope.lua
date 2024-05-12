return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>lh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>lm", builtin.marks, {})
		vim.keymap.set("n", "<leader>lb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>lf", builtin.quickfix, {})
		vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, {})
	end,
}
