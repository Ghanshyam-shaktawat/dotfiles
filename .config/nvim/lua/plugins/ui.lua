return {
  -- messages, cmdline and the popupmenu
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 5000,
      top_down = true,
      render = 'minimal',
    },
  },

  -- bufferline
  {
    'akinsho/bufferline.nvim',
    keys = {
      { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
      { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
    },
    opts = {
      options = {
        mode = 'tabs',
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- animations
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- customizing the starup logo
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function(_, opts)
      local logo = [[
      ██████╗ ██╗  ██╗ █████╗ ███╗   ██╗███████╗██╗  ██╗██╗   ██╗ █████╗ ███╗   ███╗
      ██╔════╝ ██║  ██║██╔══██╗████╗  ██║██╔════╝██║  ██║╚██╗ ██╔╝██╔══██╗████╗ ████║
      ██║  ███╗███████║███████║██╔██╗ ██║███████╗███████║ ╚████╔╝ ███████║██╔████╔██║
      ██║   ██║██╔══██║██╔══██║██║╚██╗██║╚════██║██╔══██║  ╚██╔╝  ██╔══██║██║╚██╔╝██║
      ╚██████╔╝██║  ██║██║  ██║██║ ╚████║███████║██║  ██║   ██║   ██║  ██║██║ ╚═╝ ██║
       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝
    ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'
      opts.config.header = vim.split(logo, '\n')
    end,
  },
}
