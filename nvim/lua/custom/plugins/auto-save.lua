return
-- auto-save
{
	'Pocco81/auto-save.nvim',
	config = function()
		require('auto-save').setup {}
	end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et