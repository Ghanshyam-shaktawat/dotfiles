-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local global = vim.g
local cmd = vim.cmd

opt.wrap = true
opt.cursorline = true

-- add highlighting to weird files
vim.filetype.add({
  extension = {
    wiki = "markdown",
  },
  filename = {
    [".env"] = "config",
    [".envrc"] = "sh",
    [".envrc.local"] = "sh",
    [".zshrc"] = "sh",
    ["go.mod"] = "gomod",
    ["go.sum"] = "gosum",
    ["requirements-dev.txt"] = "config",
    ["requirements-test.txt"] = "config",
    ["requirements.txt"] = "config",
  },
  pattern = {
    ["%.env.*"] = "config",
    ["*.tml"] = "gohtmltmpl",
    [".*/%.github/dependabot.yaml"] = "dependabot",
    [".*/%.github/dependabot.yml"] = "dependabot",
    [".*/%.github/workflows/[%w/]+.*%.yaml"] = "gha",
    [".*/%.github/workflows[%w/]+.*%.yml"] = "gha",
    ["gitconf.*"] = "gitconfig",
  },
})
vim.treesitter.language.register("yaml", "gha")
vim.treesitter.language.register("yaml", "dependabot")

-- don't show tab indicators
opt.listchars = { tab = "  " }
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.undofile = true
opt.clipboard:append("unnamedplus") -- Enable copying to system clipboard
global.autoformat = true --enabled autoformat on save

opt.fillchars = {
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "░", -- ╱ ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
  horiz = " ",
  horizup = " ",
  horizdown = " ",
  vert = " ",
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
}
opt.wildignore = {
  "*.aux,*.out,*.toc",
  "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
  -- media
  "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
  "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
  "*.eot,*.otf,*.ttf,*.woff",
  "*.doc,*.pdf",
  -- archives
  "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
  -- temp/system
  "*.*~,*~ ",
  "*.swp,.lock,.DS_Store,._*,tags.lock",
  -- version control
  ".git,.svn",
  --rust
  "Cargo.lock,Cargo.Bazel.lock",
}

--bufferline
global.toggle_theme_icon = "   "
cmd("function! TbToggle_theme(a,b,c,d) \n lua require('config.utils').toggle_theme() \n endfunction")
cmd("function! Quit_vim(a,b,c,d) \n qa \n endfunction")
