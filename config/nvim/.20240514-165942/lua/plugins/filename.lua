return {
  -- show filename when on top of buffer.
  'b0o/incline.nvim',
  dependencies = { 'folke/tokyonight.nvim' },
  event = 'BufReadPre',
  priority = 1200,
  config = function()
    local colors = require('tokyonight.colors').setup()
    require('incline').setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = colors.green1, guifg = colors.bg_dark },
          InclineNormalNC = { guifg = colors.fg, guibg = colors.blue7 },
        },
      },
      window = {
        margin = { vertical = 1, horizontal = 1 },
        padding = 0,
        placement = { vertical = 'top', horizontal = 'right' },
      },
      hide = {},
      render = function(props)
        local filename =
          vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        local ft_icon, ft_color =
          require('nvim-web-devicons').get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local buffer = {
          ft_icon and {
            ' ',
            ft_icon,
            ' ',
            guibg = ft_color,
            guifg = '#ffffff',
          } or '',
          ' ',
          { filename },
          ' ',
        }
        return buffer
      end,
    })
  end,
}
--
--
-- none = "NONE",
--   bg_dark = "#1f2335",
--   bg = "#24283b",
--   bg_highlight = "#292e42",
--   terminal_black = "#414868",
--   fg = "#c0caf5",
--   fg_dark = "#a9b1d6",
--   fg_gutter = "#3b4261",
--   dark3 = "#545c7e",
--   comment = "#565f89",
--   dark5 = "#737aa2",
--   blue0 = "#3d59a1",
--   blue = "#7aa2f7",
--   cyan = "#7dcfff",
--   blue1 = "#2ac3de",
--   blue2 = "#0db9d7",
--   blue5 = "#89ddff",
--   blue6 = "#b4f9f8",
--   blue7 = "#394b70",
--   magenta = "#bb9af7",
--   magenta2 = "#ff007c",
--   purple = "#9d7cd8",
--   orange = "#ff9e64",
--   yellow = "#e0af68",
--   green = "#9ece6a",
--   green1 = "#73daca",
--   green2 = "#41a6b5",
--   teal = "#1abc9c",
--   red = "#f7768e",
--   red1 = "#db4b4b",
--   git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
--   gitSigns = {
--     add = "#266d6a",
--     change = "#536c9e",
--     delete = "#b2555b",
--   },
-- }
--
-- M.night = {
--   bg = "#1a1b26",
--   bg_dark = "#16161e",
-- }
