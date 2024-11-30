return {
	'Exafunction/codeium.vim',
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set('i', '<C-g>', function()
			return vim.fn['codeium#Accept']()
		end, { expr = true })
		vim.keymap.set('i', '<c-;>', function()
			return vim.fn['codeium#CycleCompletions'](1)
		end, { expr = true })
		vim.keymap.set('i', '<c-,>', function()
			return vim.fn['codeium#CycleCompletions'](-1)
		end, { expr = true })
		vim.keymap.set('i', '<c-x>', function()
			return vim.fn['codeium#Clear']()
		end, { expr = true })
	end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et