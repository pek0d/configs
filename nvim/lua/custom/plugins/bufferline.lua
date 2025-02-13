return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				always_show_bufferline = false,
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},
			},
		})
	end,
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
