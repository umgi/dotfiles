local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
	},
})

vim.cmd([[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost * FormatWrite
	augroup END
]])
