-- Keykeymap.sets are automatically loaded on the VeryLazy event
-- Default keykeymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keykeymap.sets here

-- discipline to not spam j,h,k,l and instead use number keys.
local discipline = require("ghan/discipline")
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Press jj,jk fast to exit the insert mode
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "jk", "<ESC>", opts)

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Save a file with Space + W.
-- keymap.set("n", "<space>w", "<cmd>write<cr>", { desc = "Save" })

-- Selet all command with Ctrl + A.
keymap.set("n", "<C-a>", "gg<S-v>G$")

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- comment and uncomment a whole line or wrapper
keymap.set("n", ".", "gc%", { desc = "Comment/Uncomment", remap = true })
keymap.set("v", ".", "gc%", { desc = "Comment/Uncomment", remap = true })

-- New Tabs
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split tabs
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move between split windows or in between buffer
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")

-- Resize the split windows
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagonistics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
