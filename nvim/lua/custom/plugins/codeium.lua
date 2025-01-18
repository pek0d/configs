return {
	"Exafunction/codeium.vim",
	config = function()
		-- Key bindings
		-- vim.g.codeium_no_map_tab = true
		-- vim.keymap.set("i", "<C-l>", function()
		-- 	return vim.fn["codeium#Accept"]()
		-- end, { expr = true, silent = true })
		-- vim.keymap.set("i", "<C-j>", function()
		-- 	return vim.fn["codeium#CycleCompletions"](1)
		-- end, { expr = true, silent = true })
		-- vim.keymap.set("i", "<C-k>", function()
		-- 	return vim.fn["codeium#CycleCompletions"](-1)
		-- end, { expr = true, silent = true })
		-- vim.keymap.set("i", "<C-d>", function()
		-- 	return vim.fn["codeium#Clear"]()
		-- end, { expr = true, silent = true })
	end,
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
