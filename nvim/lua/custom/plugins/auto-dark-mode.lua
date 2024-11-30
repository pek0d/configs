return {
	"f-person/auto-dark-mode.nvim",
	opts = {
		update_interval = 1000,
		set_dark_mode = function()
			vim.cmd("colorscheme minischeme")
		end,
		set_light_mode = function()
			vim.cmd("colorscheme onedark")
		end,
	},
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et