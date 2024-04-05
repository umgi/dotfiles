local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.diagnostic.config({ signs = false })

map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true, buffer = bufnr }

	buf_set_keymap("n", "gD", vim.lsp.buf.declaration, opts)
	buf_set_keymap("n", "gd", vim.lsp.buf.definition, opts)
	buf_set_keymap("n", "K", vim.lsp.buf.hover, opts)
	buf_set_keymap("n", "gi", vim.lsp.buf.implementation, opts)
	buf_set_keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	buf_set_keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	buf_set_keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	buf_set_keymap("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	buf_set_keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
	buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	buf_set_keymap("n", "gr", vim.lsp.buf.references, opts)
	buf_set_keymap("n", "<leader>f", vim.lsp.buf.formatting, opts)

	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "ff", vim.lsp.buf.formatting, opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "ff", vim.lsp.buf.range_formatting, opts)
	end

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
			hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
			hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
			augroup lsp_document_highlight
				autocmd! *           <buffer>
				autocmd  CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
			augroup END
		]],
			false
		)
	end
end

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

lspconfig.gopls.setup(config({
	cmd = { "gopls", "serve" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "go", "go.mod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
}))

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = { "pyright" },
})

lspconfig.pyright.setup(config({
	capabilities = capabilities,
}))

lspconfig.ccls.setup({
	init_options = {
		cache = {
			directory = "/tmp/ccls",
		},
	},
})
