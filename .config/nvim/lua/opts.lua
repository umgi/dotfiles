local o = vim.opt
local t = true
local f = false

o.clipboard = o.clipboard + 'unnamedplus'
o.compatible = f

o.ruler = t
o.backspace = 'eol,start,indent'
o.ignorecase = t
o.smartcase = t
o.incsearch = t
o.lazyredraw = t
o.hlsearch = t
o.magic = f -- regexp search
o.showmatch = t
o.foldcolumn = '1'
o.number = t
o.relativenumber = t
o.completeopt = 'menuone,noinsert,noselect'
o.shortmess = o.shortmess + 'aTc'
o.previewheight = 10
o.laststatus = 2
o.scrolloff = 10
o.signcolumn = 'yes'
o.splitbelow = t
o.splitright = t
o.list = t
o.listchars = 'tab:  ,trail:.,extends:>,precedes:<,lead:_'
o.cmdheight = 1
o.modeline = t

o.wildmenu = t
o.wildmode = 'list:longest'

-- Files, backups and undo
o.backup = t
o.writebackup = t
o.backupdir = vim.fn.stdpath('data') .. '/backup//'
o.swapfile = f
o.hidden = t

o.path = o.path + '**'
o.autowrite = t

-- Text/Indent
o.expandtab = f
o.smarttab = t
o.shiftwidth = 2
o.tabstop = 2
o.autoindent = t
o.smartindent = t
o.cindent = t
o.wrap = t 
