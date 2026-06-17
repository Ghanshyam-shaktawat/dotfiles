-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local aucmd = vim.api.nvim_create_autocmd

-- Set relative line numbers in normal mode
aucmd({ "InsertEnter" }, {
  callback = function()
    local fname = vim.fn.bufname()
    if fname == "copilot-chat" or vim.bo.buftype == "nofile" then
      return
    end
    vim.opt_local.relativenumber = false
  end,
})

-- and absolute line numbers in insert mode
aucmd({ "InsertLeave" }, {
  callback = function()
    local fname = vim.fn.bufname()
    if fname == "copilot-chat" or vim.bo.buftype == "nofile" then
      return
    end
    vim.opt_local.relativenumber = true
  end,
})

-- Terminal
aucmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})
