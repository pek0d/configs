-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = 'Neotree',
    keys = {{'\\', ':Neotree reveal<CR> ', desc = 'NeoTree reveal', silent = true },},
	  opts = {
    	filesystem = { filtered_items = { hide_dotfiles = false, never_show = { ".DS_Store", "thumbs.db"},
    	window = { mappings = {['\\'] = 'close_window',},
},
},
},
},
} 