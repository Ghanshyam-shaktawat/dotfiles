return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "json-lsp",
        "css-lsp",
        "html-lsp",
        "flake8",
        "black",
        "ruff",
        "prettier",
        "markdownlint",
        "eslint-lsp",
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    -- https://github.com/mfussenegger/nvim-lint
    enabled = true,
    opts = function(_, opts)
      local linters = require("lint").linters

      local linters_by_ft = {
        -- this extends lazyvim's nvim-lint setup
        -- https://www.lazyvim.org/extras/linting/nvim-lint
        python = { "ruff" },
        javascript = { "eslint" },
        typescript = { "eslint" },
      }

      -- extend opts.linters_by_ft
      for ft, linters_ in pairs(linters_by_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        vim.list_extend(opts.linters_by_ft[ft], linters_)
      end
    end,
  },

  {
    "nvim-lspconfig",
    opts = {
      -- -@type lspconfig.options
      servers = {
        pyright = {
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
                  reportUnusedVariable = "none", -- or anything
                },
                typeCheckingMode = "basic",
              },
            },
          },
        },
        ruff_lsp = {
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
        },
      },
    },
  },
}
