return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = false, -- Можно сделать фон прозрачным
				},
			})
		end,
	},
}
