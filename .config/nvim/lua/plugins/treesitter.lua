require('nvim-treesitter.configs').setup{
  ensure_installed = { 'lua', 'go' },
	--ensure_installed = 'all',
	--ignore_install = {'phpdoc'},
	highlight = { enable = true }
}
