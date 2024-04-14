vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader= " "

vim.wo.relativenumber=true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins={
  -- catppuccin Theme 
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- telescope fuzzy finder
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
  -- treesitter, indent
  { "nvim-treesitter/nvim-treesitter", build=":TSUpdate"},
  -- neotree 
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
}
}

local opts={}

require("lazy").setup(plugins, opts)

-- TELESCOPE 
local builtin = require("telescope.builtin")
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
-- alsway instal ripgrep, sudo apt-get install ripgrep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>fr', ':Neotree filesystem reveal left<CR>')

-- TREE SITTER
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript"},
  highlight = {enable=true},
  indent = {enable=true},
})

-- catppuccin THEME
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"



