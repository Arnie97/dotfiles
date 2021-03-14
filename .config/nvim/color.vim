if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

if has('autocmd')
    silent! colorscheme iceberg
    autocmd FileType python syntax keyword pythonDecorator True False None self
    autocmd FileType python,ruby,lua,basic,vb,vim,lisp,clojure,scheme,haskell,yaml,html,xhtml,xml,vue,eex,php,asp,jsp,smarty setlocal foldmethod=indent
    autocmd FileType git set foldmethod=syntax
    autocmd BufNewFile,BufRead *.ksy setfiletype yaml
    autocmd BufNewFile,BufRead */systemd/* setfiletype dosini
else
    silent! colorscheme slate
    finish
endif

" set termguicolors
" let g:quantum_black=1
" let g:quantum_italics=1
" colorscheme quantum

if !exists('g:lightline')
    finish
endif

if system('tput colors') == 256
    let g:lightline.separator    = {'left': '', 'right': ''}
    let g:lightline.subseparator = {'left': '', 'right': ''}
endif
