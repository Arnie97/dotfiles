" This is a minimal standalone configuration for vim-tiny
" Load the plugin-powered neovim configuration instead if it exists
if isdirectory($HOME.'/.config/nvim/.git')
    set rtp+=~/.config/nvim
    source ~/.config/nvim/init.vim
    finish
endif

set nocp noswapfile nu ru sc wmnu ai ar is hls bs=indent,eol,start so=7

map <space> :
map <bslash> "
map <bslash><bslash> :registers<cr>
map mm :marks<cr>

if has('syntax')
  syntax on
endif

if has('filetype')
  filetype plugin on
  filetype plugin indent on
endif

if has('autocmd')
  " When saving a file, remove trailing spaces
  autocmd BufWritePre * %s/\s\+$//e

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if 1 < line('''"') && line('''"') <= line('$') && &ft !~# 'commit'
  \ | execute 'normal! g''"'
  \ | endif
endif
