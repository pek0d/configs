return {
  "f-person/auto-dark-mode.nvim",
  config = function()
    require("auto-dark-mode").setup({
      update_interval = 1350, -- Проверять каждые 1 сек (по умолчанию 1000 мс)
      set_dark_mode = function()
        vim.cmd("colorscheme catppuccin-frappe") -- Тёмная тема
      end,
      set_light_mode = function()
        vim.cmd("colorscheme catppuccin-latte") -- Светлая тема
      end,
    })
  end,
}
