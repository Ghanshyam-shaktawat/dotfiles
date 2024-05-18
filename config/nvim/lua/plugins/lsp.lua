return {

  {
    'mfussenegger/nvim-lint',
    -- https://github.com/mfussenegger/nvim-lint
    enabled = true,
    opts = {
      events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
      linters_by_ft = {
        -- this extends lazyvim's nvim-lint setup
        -- https://www.lazyvim.org/extras/linting/nvim-lint
        python = { 'ruff' },
        -- javascript = { 'eslint' },
        -- typescript = { 'eslitn' },
        -- javascriptreact = { 'eslint' },
        -- typescriptreact = { 'eslint' },
        markdown = { 'markdownlint' },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      -- -@type lspconfig.options
      inlay_hints = { enabled = true },
      servers = {
        pyright = {
          enabled = true,
          capabilities = (function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
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
        neocmake = {},
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
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = 'Both',
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = 'Disable',
                semicolon = 'Disable',
                arrayIndex = 'Disable',
              },
              doc = {
                privateName = { '^_' },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { 'incomplete-signature-doc', 'trailing-space' },
                -- enable = false,
                groupSeverity = {
                  strong = 'Warning',
                  strict = 'Warning',
                },
                groupFileStatus = {
                  ['ambiguity'] = 'Opened',
                  ['await'] = 'Opened',
                  ['codestyle'] = 'None',
                  ['duplicate'] = 'Opened',
                  ['global'] = 'Opened',
                  ['luadoc'] = 'Opened',
                  ['redefined'] = 'Opened',
                  ['strict'] = 'Opened',
                  ['strong'] = 'Opened',
                  ['type-check'] = 'Opened',
                  ['unbalanced'] = 'Opened',
                  ['unused'] = 'Opened',
                },
                unusedLocalExclude = { '_*' },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = 'space',
                  indent_size = '2',
                  continuation_indent_size = '2',
                },
              },
            },
          },
        },
      },
      -- setup = {
      --   eslint = function()
      --     local function get_client(buf)
      --       return require('lazyvim.util').lsp.get_clients({ name = 'eslint', bufnr = buf })[1]
      --     end
      --
      --     local formatter = require('lazyvim.util').lsp.formatter({
      --       name = 'eslint: lsp',
      --       primary = false,
      --       priority = 200,
      --       filter = 'eslint',
      --     })
      --
      --     -- Use EslintFixAll on Neovim < 0.10.0
      --     if not pcall(require, 'vim.lsp._dynamic') then
      --       formatter.name = 'eslint: EslintFixAll'
      --       formatter.sources = function(buf)
      --         local client = get_client(buf)
      --         return client and { 'eslint' } or {}
      --       end
      --       formatter.format = function(buf)
      --         local client = get_client(buf)
      --         if client then
      --           local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
      --           if #diag > 0 then
      --             vim.cmd('EslintFixAll')
      --           end
      --         end
      --       end
      --     end
      --
      --     -- register the formatter with LazyVim
      --     require('lazyvim.util').format.register(formatter)
      --   end,
      -- },
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
          vim.list_extend(opts.ensure_installed, { 'java-test', 'java-debug-adapter' })
        end,
      },
    },
  },
}
