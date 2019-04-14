#!/bin/sh
""git clone https://github.com/amix/vimrc ~/.config/nvim
""git clone https://github.com/ap/vim-css-color ~/.config/nvim/my_plugins/vim-css-color
""exit # the magic polyglot is valid in both shell and vim

" nice defaults
source ~/.config/nvim/vimrcs/basic.vim
source ~/.config/nvim/vimrcs/filetypes.vim
source ~/.config/nvim/vimrcs/plugins_config.vim
source ~/.config/nvim/vimrcs/extended.vim

" visualize whitespaces, and remove trailing spaces on save
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e
set list listchars+=trail:·,extends:>,precedes:<,conceal:…,nbsp:⎵

" line numbers, gutter and cursor
set number cursorline
set noshowmode showcmd cmdheight=1
set updatetime=100
highlight CursorLine cterm=none ctermbg=237
highlight CursorLineNr cterm=none ctermbg=237 ctermfg=white
let g:gitgutter_enabled = 1
let g:go_version_warning = 0

" key bindings
let mapleader = ','
map <leader>p :CtrlP<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader><leader> :MRU<cr>
map <space> :
map <bslash> "
map <bslash><bslash> :registers<cr>
map mm :marks<cr>
noremap ' `
noremap ` '
tnoremap <c-w> <c-\><c-n>
cabbrev git Git

" keep home directory clean
let MRU_File = $HOME . '/.config/nvim/temp_dirs/mru'
try
    set undodir=~/.config/nvim/temp_dirs/undodir
catch
endtry

" schemes: wombat, powerline, jellybeans, PaperColor, seoul256
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
        \ 'branch': '%{fugitive#head()}',
        \ 'modified': '%{&modifiable?(&readonly?"🔒":"").(&modified?"+":""):"-"}'
    \ },
    \ 'component_visible_condition': {
        \ 'branch': '(exists("*fugitive#head") && ""!=fugitive#head())',
    \ },
    \ 'active': {'left': [
        \ ['mode', 'paste'],
        \ ['branch', 'filename', 'modified']
    \ ]},
    \ 'inactive': {'left': [
        \ ['filename', 'modified']
    \ ]},
\ }

if system('tput colors') == 256
    let g:lightline.separator    = {'left': '', 'right': ''}
    let g:lightline.subseparator = {'left': '', 'right': ''}
endif
