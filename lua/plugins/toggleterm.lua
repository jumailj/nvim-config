return function(use)
    use {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require('toggleterm').setup {
                -- Add your custom settings here
                open_mapping = [[<C-t>]], -- Example: Map Ctrl-T to toggle the terminal
                direction = 'float',     -- Floating terminal
            }
        end
    }
end
