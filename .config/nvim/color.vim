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
    autocmd FileType go set makeprg=go
    autocmd BufNewFile,BufRead *.ksy setfiletype yaml
    autocmd BufNewFile,BufRead */systemd/* setfiletype dosini
else
    silent! colorscheme slate
    finish
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
