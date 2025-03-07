return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				-- Локальная функция для создания keymap
				local function map(mode, lhs, rhs, desc, opts)
					opts = opts or {}
					opts.buffer = bufnr
					opts.desc = desc
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Навигация по изменениям
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Jump to next git [c]hange")

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Jump to previous git [c]hange")

				-- Действия в визуальном режиме
				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage git hunk")

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset git hunk")

				-- Действия в нормальном режиме
				map("n", "<leader>hs", gitsigns.stage_hunk, "Git [s]tage hunk")
				map("n", "<leader>hr", gitsigns.reset_hunk, "Git [r]eset hunk")
				map("n", "<leader>hS", gitsigns.stage_buffer, "Git [S]tage buffer")
				map("n", "<leader>hu", gitsigns.stage_hunk, "Git [u]ndo stage hunk")
				map("n", "<leader>hR", gitsigns.reset_buffer, "Git [R]eset buffer")
				map("n", "<leader>hp", gitsigns.preview_hunk, "Git [p]review hunk")
				map("n", "<leader>hb", gitsigns.blame_line, "Git [b]lame line")
				map("n", "<leader>hd", gitsigns.diffthis, "Git [d]iff against index")
				map("n", "<leader>hD", function()
					gitsigns.diffthis("@")
				end, "Git [D]iff against last commit")

				-- Переключатели
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "[T]oggle git show [b]lame line")
				map("n", "<leader>tD", gitsigns.preview_hunk_inline, "[T]oggle git show [D]eleted")
			end,
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
