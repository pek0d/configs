return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not строго обязательно, но желательно
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true },
	},
	opts = {
		enable_git_status = true, -- Включаем поддержку Git
		git_status = {
			symbols = {
				added     = "✚",
				modified  = "",
				deleted   = "✖",
				renamed   = "➜",
				untracked = "★",
				ignored   = "◌",
				unstaged  = "✗",
				staged    = "✓",
				conflict  = "",
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				never_show = { ".DS_Store", "thumbs.db" },
			},
		},
	},
}-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	cmd = "Neotree",
-- 	keys = { { "\\", ":Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true } },
-- 	opts = {
-- 		git_status = {
-- 			symbols = {
-- 				added = "✚",
-- 				modified = "",
-- 				deleted = "✖",
-- 				renamed = "➜",
-- 				untracked = "★",
-- 				ignored = "◌",
-- 				unstaged = "✗",
-- 				staged = "✓",
-- 				conflict = "",
-- 			},
-- 		},
-- 		show_separators_on_edge = true,
-- 		filesystem = {
-- 			filtered_items = {
-- 				hide_dotfiles = false,
-- 				never_show = { ".DS_Store", "thumbs.db" },
-- 				window = { mappings = { ["\\"] = "close_window" } },
-- 			},
-- 		},
-- 	},
-- }
