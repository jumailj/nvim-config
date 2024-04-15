return{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim'},
    config = function()
      local builtin= require("telescope.builtin")
      vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
           ["ui-select"] = {
              require("telescope.themes").get_dropdown {
               }
             }
          }
        }
         require("telescope").load_extension("ui-select")
    end 
  },
}
