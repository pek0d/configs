return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = { { "\\", ":Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true } },
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				never_show = { ".DS_Store", "thumbs.db" },
				window = { mappings = { ["\\"] = "close_window" } },
			},
		},
	},
}

