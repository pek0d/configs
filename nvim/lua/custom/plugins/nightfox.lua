return {
	"EdenEast/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				transparent = false,
				dim_inactive = true,
				terminal_colors = true,
				styles = {
					comments = "italic",
				},
			},
		})
	end,
}
