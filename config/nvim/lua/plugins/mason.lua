return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'stylua',
        'selene',
        'shellcheck',
        'shfmt',
        'tailwindcss-language-server',
        'typescript-language-server',
        'json-lsp',
        'css-lsp',
        'html-lsp',
        'black',
        'ruff',
        'prettier',
        'markdownlint',
        'jdtls',
        'cmakelang',
        'cmakelint',
      })
    end,
  },
}
