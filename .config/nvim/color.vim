if !has('autocmd')
    silent! colorscheme slate
    finish
endif

silent! colorscheme iceberg

autocmd BufNewFile,BufRead /etc/wireguard/*.conf* setfiletype cfg
autocmd BufNewFile,BufRead */systemd/* setfiletype cfg
autocmd BufNewFile,BufRead *.ksy setfiletype yaml

autocmd FileType python,ruby,lua,basic,vb,vim,lisp,clojure,scheme,racket,haskell,yaml,html,xhtml,xml,vue,eex,php,asp,jsp,smarty
    \ if empty(&foldexpr) | setlocal foldmethod=indent | endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

if has('termguicolors')
    autocmd ColorSchemePre * set notermguicolors
    autocmd ColorSchemePre apprentice,atom,ayu,carbon*,*deep*,*flat*,github,gotham*,*material*,moloka*,mountaineer*,*moon,nord,ocean*,one*,pyte,quantum,snow,solarized8*,st*,tw*\c set termguicolors
endif

if !exists('g:lightline')
    finish
endif

if system('tput colors') == 256
    let g:lightline.separator    = {'left': '', 'right': ''}
    let g:lightline.subseparator = {'left': '', 'right': ''}
endif

autocmd ColorScheme * call s:LightLineColorSchemeUpdate()
autocmd VimEnter    * call s:LightLineColorSchemeUpdate()

function s:LightLineColorSchemeUpdate()
    let scheme = matchstr(substitute(g:colors_name, '-', '_', 'g'),
        \ '\v\Cayu|deus|gotham\d*|material|nord|solarized|Tomorrow\w*')

    let g:lightline.colorscheme =
        \ len(scheme)? scheme:
        \ &background == 'light'? 'PaperColor':
        \ g:colors_name =~ '\v\cdeep|moon|^(atom|ocean|one|two|st)'? 'nord':
        \ has('termguicolors') && &termguicolors? 'seoul256': 'wombat'

    call lightline#init()
    call lightline#update()
endfunction
