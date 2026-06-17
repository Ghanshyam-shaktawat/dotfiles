local M = {}

local api = vim.api
local fn = vim.fn
local ts = vim.treesitter

M.is_online = function()
  if vim.env.NVIM_OFFLINE == "1" then
    return false
  end

  local host = "api.github.com"
  local is_online = false

  local ok, res = pcall(function()
    return vim.uv.getaddrinfo(host, nil, { socktype = "stream" })
  end)

  if ok and res and #res > 0 then
    is_online = true
  end

  return is_online
end

return M
