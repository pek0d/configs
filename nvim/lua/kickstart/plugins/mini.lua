return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Starter
		require("mini.starter").setup()

		-- Minimap
		require("mini.map").setup({
			windblend = 55,
		})
		vim.keymap.set("n", "<Leader>mc", MiniMap.close)
		vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
		vim.keymap.set("n", "<Leader>mo", MiniMap.open)
		vim.keymap.set("n", "<Leader>mr", MiniMap.refresh)
		vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
		vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)

		-- Indentation guides
		require("mini.indentscope").setup()

		-- Diffs git
		require("mini.diff").setup()

		-- Show next key (clue)
		require("mini.clue").setup()
	end,
}
-- vim: ts=2 sts=2 sw=2 et
