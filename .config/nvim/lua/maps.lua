local opts = { noremap = true}
local map = vim.api.nvim_set_keymap

local g = vim.g
g.mapleader = ' '

map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>j', '<C-w>j', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>l', '<C-w>l', opts)

map('n', '<leader><F8>', ':source $MYVIMRC', opts)
map('n', '<leader><F9>', ':PackerInstall<CR>', opts)

-- ?
-- Quick fix
--map <C-j> :cn<CR>
--map <C-k> :cp<CR>

local optns = { noremap = true, silent = true }

map('n', '<Space>', '<NOP>', opts)

map('n', '<Leader>h', ':set hlsearch!<CR>', opts)
map('n', '<Leader>e', ':Lexplore<CR>', opts)

-- window management
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

-- indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- escaping
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)
map('i', 'jj', '<ESC>', opts)


-- tab switch buffer
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-TAB>', ':bprevious<CR>', opts)

-- move selected block in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', opts)
map('x', 'J', ':move \'>+1<CR>gv-gv', opts)
