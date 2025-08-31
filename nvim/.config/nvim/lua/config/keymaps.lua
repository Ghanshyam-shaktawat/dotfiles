--  ╭─────────────────────────────────────────────────────────────────────────────╮
--  │            Keymaps are automatically loaded on the VeryLazy event           │
--  │                     Default keymaps that are always set:                    │
--  │ https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua │
--  ╰─────────────────────────────────────────────────────────────────────────────╯

-- local util = require("util")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Change word with cc
map("n", "cc", "<cmd>! ciw<cr>a")

-- Press jj,jk fast to exit the insert mode
-- remapping escape key
map({ "i" }, "jj", "<Esc>", { desc = "Escape", noremap = true, silent = true })
map({ "i" }, "jk", "<Esc>", { desc = "Escape", noremap = true, silent = true })

-- Diagonistics
map("n", "<leader>d", function()
  vim.diagnostic.goto_next()
end, { desc = "Go to next line diagnostic" })

-- Indenting
map("v", "<", "<gv", { desc = "Indent >", noremap = true, silent = false })
map("v", ">", ">gv", { desc = "Indent <", noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { desc = "Copy To ClipB", noremap = true, silent = false })
map("n", "<C-s>", '"+P', { desc = "Paste From ClipB", noremap = true, silent = false })

-- TMUX SWITCH PANE
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
