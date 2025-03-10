return {
	"f-person/auto-dark-mode.nvim",
	opts = {
		set_dark_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			vim.cmd("colorscheme carbonfox")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option_value("background", "light", {})
			vim.cmd("colorscheme catppuccin")
		end,
		update_interval = 3000,
		fallback = "dark",
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
