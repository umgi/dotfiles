"" auto install plug
if ! filereadable(system('echo -n "$XDG_DATA_HOME/nvim/site/autoload/plug.vim"'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

call plug#begin('$XDG_DATA_HOME/nvim/plugged')

  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'itchyny/lightline.vim'

  " Plug 'rafi/awesome-vim-colorschemes'
Plug 'mattn/emmet-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'ghifarit53/tokyonight-vim'
  "Plug 'altercation/vim-colors-solarized'
  Plug 'KeitaNakamura/neodark.vim'

  Plug 'jiangmiao/auto-pairs'
  " Plug 'dyng/ctrlsf.vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-commentary'
  Plug 'dominikduda/vim_current_word'
  Plug 'rkitover/vimpager'
  Plug 'vimwiki/vimwiki'


  Plug 'junegunn/goyo.vim'

  Plug 'airblade/vim-rooter'

  Plug 'baskerville/vim-sxhkdrc'

  " javascript
  Plug 'evanleck/vim-svelte'
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'codechips/coc-svelte', {'do': 'npm install'}

  Plug 'prettier/vim-prettier', {'do': 'npm install'}

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

  Plug 'OmniSharp/omnisharp-vim'

call plug#end()

source $XDG_CONFIG_HOME/nvim/plugins/nerdtree.vim
source $XDG_CONFIG_HOME/nvim/plugins/fzf.vim
source $XDG_CONFIG_HOME/nvim/plugins/coc.vim
source $XDG_CONFIG_HOME/nvim/plugins/prettier.vim
source $XDG_CONFIG_HOME/nvim/plugins/ale.vim
source $XDG_CONFIG_HOME/nvim/plugins/omnisharp.vim
