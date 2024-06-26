-- -----------------------------------------------
-- -- name : nvim-lualine
-- -- url  : https://github.com/nvim-lualine/lualine.nvim
-- -----------------------------------------------
-- local M = {
--   'nvim-lualine/lualine.nvim',
--   event = 'VeryLazy',
-- }
--
-- function M.config()
--   -- local my_filename = require('lualine.components.filename'):extend()
--   -- my_filename.apply_icon = require('lualine.components.filetype').apply_icon
--   -- my_filename.colored = true
--   --
--   -- local filename_with_path = {
--   --   my_filename,
--   --   path = 1,
--   --   symbols = { modified = ' ', readonly = '', unnamed = ' ' },
--   -- }
--
--   require('lualine').setup({
--     options = {
--       icons_enabled = true,
--       theme = 'auto',
--       -- globalstatus = true, -- to have just one lualine, the inactive_* won't work
--       component_separators = { left = '', right = '' },
--       section_separators = { left = '', right = '' },
--       always_divide_middle = true,
--     },
--     sections = {
--       lualine_a = {
--         'mode',
--       },
--       lualine_b = {
--         'branch',
--       },
--       lualine_c = {
--         'filetype',
--         { 'filename', colored = true, color = { fg = '#00ffff' } },
--       },
--       lualine_x = {
--         'encoding',
--         'fileformat',
--         {
--           'diff',
--           colored = true,
--           color = { fg = '#ffffff' },
--           symbols = { added = ' ', modified = ' ', removed = ' ' },
--         },
--       },
--       lualine_y = {
--         'progress',
--         'location',
--       },
--       lualine_z = {
--         {
--           'datetime',
--           style = '%I:%M %p', -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
--         },
--       },
--     },
--     inactive_sections = {},
--     etensions = { 'nvim-tree' },
--     tabline = {},
--     winbar = {},
--     inactive_winbar = {},
--   })
-- end
--
-- return M
-- --
-- -- statusline
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      -- globalstatus = false,
      theme = 'catppuccin-mocha',
      sections = {
        lualine_a = {},
      },
    },
  },
}
