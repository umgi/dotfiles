local optns = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', optns)
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', optns)
vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>', optns)

-- window management
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent=true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent=true})

-- indenting
vim.api.nvim_set_keymap('v', '<', '<gv', optns)
vim.api.nvim_set_keymap('v', '>', '>gv', optns)

-- escaping
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', optns)
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', optns)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', optns)


-- tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', optns)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', optns)

-- move selected block in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', optns)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', optns)
