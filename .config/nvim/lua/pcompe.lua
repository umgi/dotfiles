vim.o.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'

cmp.setup {
	snippet = {
		expand = function(args)

		end
	},
	window = {},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
	})
}
