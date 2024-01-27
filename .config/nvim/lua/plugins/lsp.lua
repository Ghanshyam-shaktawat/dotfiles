return {

  {
    'mfussenegger/nvim-lint',
    -- https://github.com/mfussenegger/nvim-lint
    enabled = true,
    opts = {
      linters_by_ft = {
        -- this extends lazyvim's nvim-lint setup
        -- https://www.lazyvim.org/extras/linting/nvim-lint
        python = { 'ruff', 'flake8' },
        javascript = { 'eslint' },
        typescript = { 'eslint' },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      -- -@type lspconfig.options
      inlay_hints = { enabled = false },
      servers = {
        pyright = {
          enabled = true,
          capabilities = (function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.publishDiagnostics.tagSupport.valueSet =
              { 2 }
            return capabilities
          end)(),
          settings = {
            python = {
              analysis = {
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = 'none',
                  reportOptionalMemberAccess = 'none',
                },
                typeCheckingMode = 'basic',
              },
            },
          },
        },
        ruff_lsp = {
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
        },
        cssls = {},
        html = {},
        tsserver = {
          root_dir = function(...)
            return require('lspconfig.util').root_pattern('.git')(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'literal',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        jdtls = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      diagnostics = { virtual_text = { prefix = 'icons' } },
    },
  },

  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(
            opts.ensure_installed,
            { 'java-test', 'java-debug-adapter' }
          )
        end,
      },
    },
  },
}
