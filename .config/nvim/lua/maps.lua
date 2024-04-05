local opts = { noremap = true }
local map = vim.api.nvim_set_keymap

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

map("n", "<leader><F8>", ":source $MYVIMRC<CR>", opts)
map("n", "<leader><F9>", ":PackerInstall<CR>", opts)

-- ?
-- Quick fix
--map <C-j> :cn<CR>
--map <C-k> :cp<CR>

local optns = { noremap = true, silent = true }

map("n", "<Space>", "<NOP>", opts)

map("n", "<Leader>h", ":set hlsearch!<CR>", opts)
map("n", "<Leader>e", ":Lexplore<CR>", opts)

-- window management
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})

-- indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- escaping
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map("i", "jj", "<ESC>", opts)

-- tab switch buffer
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", ":bprevious<CR>", opts)

-- move selected block in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- sublime text like 'Expand selection to Word' but with change before
-- viW - select Word under cursor
-- y - copy
-- q/p<CR> - paste with preceding / for search
-- N - move back one selection
-- cgn - change next selection
-- . - apply as many as you want
-- n - skip next
map("n", "<C-d>", "viWyq/p<CR>Ncgn", opts)

map("n", "<leader>pt", "<cmd>:NvimTreeToggle<CR>", opts)
map("n", "<C-k><C-b>", "<cmd>:NvimTreeToggle<CR>", opts)
map("n", "<C-b>", "<cmd>:NvimTreeToggle<CR>", opts)

-- debug
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", optns)
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", optns)
map("n", "<F5>", ":lua require'dap'.continue()<CR>", optns)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", optns)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", optns)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", optns)
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", optns)
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", optns)
map("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", optns)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", optns)
