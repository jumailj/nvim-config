-- |  CATPPUCCIN  | --
--[[ return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
--]]

--  | GRUV-BOX | ---

--return {
 -- "ellisonleao/gruvbox.nvim",
 -- priority = 1000,
 -- config = function()
 --   vim.o.background = "dark"
 --   vim.cmd([[colorscheme gruvbox]])
 -- end
--}

--  | NIGHT OWL |--
return{
  "oxfist/night-owl.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd.colorscheme("night-owl")
  end,
}
