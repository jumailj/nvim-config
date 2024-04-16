return {

  { -- MASON will maange LSP config
   "williamboman/mason.nvim",
   config = function()
     require("mason").setup()
   end
  },

  { -- instead of install lsp manually, lspconfig auomatically.
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- add lsp, to ensure_installed table
        ensure_installed = { "lua_ls", "tsserver", "clangd"}
      })
    end
  },

  { -- set keybinds and setup communication with neovim and lsp
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- if you add ls to the lspconfig, you have to setup here.
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.clangd.setup({})

      --show the info, fo function.
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
      -- show the defintion of function
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      -- show code acction.
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action,{})
    end
  },

}
