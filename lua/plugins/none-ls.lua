-- linting and formating

-- you should install formater and linter manually from mason.
-- :Mason-> install litters and formatters
-- imp* someof are deprecated or native LSP replacement, use non-ls-extra.
return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
        -- lua
				null_ls.builtins.formatting.stylua,

        -- javascript
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.formatting.prettier,

			},
		})

		--format the sourcecode.
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
