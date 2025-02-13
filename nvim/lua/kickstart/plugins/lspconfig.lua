-- LSP Plugins
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } }, -- Load luvit types when the `vim.uv` word is found
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- Automatically install LSPs and related tools
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP
      'hrsh7th/cmp-nvim-lsp', -- Allows extra capabilities provided by nvim-cmp
    },
    config = function()
      -- Change diagnostic symbols in the sign column (gutter)
      if vim.g.have_nerd_font then
        local signs = { Error = '', Warn = '', Hint = '', Info = '' }
        for type, icon in pairs(signs) do
          local hl = 'DiagnosticSign' .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
      end

      -- Extend client capabilities with nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Define the list of LSP servers to enable
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},
        rust_analyzer = {},
        ruff = {},
        -- ruff_lsp = {},
        lua_ls = {
          cmd = { 'lua-language-server' },
          filetypes = { 'lua' },
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = {
                disable = { 'missing-fields' }, -- Disable noisy warnings
              },
            },
          },
        },
      }

      -- Ensure the servers and tools are installed
      require('mason').setup()

      -- Add tools that should be installed by Mason
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'ruff-lsp',
        'ruff',
        'autopep8',
        'black',
        'stylua', -- Used for formatting Lua code
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      -- Set up LSP handlers
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }

      -- Key mappings for LSP features
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Go to definition
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          -- Find references
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          -- Go to implementation
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          -- Go to type definition
          map('D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          -- Document symbols
          map('ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          -- Workspace symbols
          map('ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          -- Rename
          map('rn', vim.lsp.buf.rename, '[R]e[n]ame')
          -- Code action
          map('ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          -- Declaration
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Highlight references under the cursor
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- Toggle inlay hints if supported
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })
    end,
  },
}