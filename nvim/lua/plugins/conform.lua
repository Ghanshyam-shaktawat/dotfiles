return {
  "stevearc/conform.nvim",
  event = { "LspAttach", "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
    },
  },
}
