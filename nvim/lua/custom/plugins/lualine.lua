-- lualine status
return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {
				{
					'vim.fn["codeium#GetStatusString"]()',
					fmt = function(str)
						return "suggestions " .. str:lower():match("^%s*(.-)%s*$")
					end,
				},
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
