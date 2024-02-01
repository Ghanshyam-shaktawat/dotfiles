return {
  'stevearc/conform.nvim',
  event = { 'LspAttach', 'BufWritePre' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black', 'ruff' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      less = { 'prettier' },
      json = { 'prettier' },
      xml = { 'xmlformatter' },
      java = { 'jdtls' },
    },
  },
}
