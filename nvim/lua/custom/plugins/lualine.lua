return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				disabled_filetypes = { "NeoTree", "Dashboard" },
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = false,
				globalstatus = true,
				refresh = {
					statusline = 150,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "diagnostics", sources = { "nvim_diagnostic" } }, "branch" },
				lualine_c = { "buffers", "diff" },
				lualine_x = {},
				lualine_y = { "%p%%/%L" },
				lualine_z = { "encoding", "filesize", "fileformat" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
