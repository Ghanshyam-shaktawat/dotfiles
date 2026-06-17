return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "gabiuz/kape-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kape")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kape",
    },
  },
}
