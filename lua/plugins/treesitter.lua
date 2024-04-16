return{
  "nvim-treesitter/nvim-treesitter", 
  build=":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
    auto_install = true, -- treesitter with atomatically install.lng we use
    highlight = {enable=true},
    indent = {enable=true},
    })
  end
}
