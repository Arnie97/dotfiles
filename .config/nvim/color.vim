" fallback for unknown file types
autocmd BufNewFile,BufRead /etc/wireguard/*.conf* setfiletype cfg
autocmd BufNewFile,BufRead */systemd/* setfiletype cfg
autocmd BufNewFile,BufRead *.ksy setfiletype yaml

autocmd FileType python,ruby,lua,basic,vb,vim,lisp,clojure,scheme,racket,haskell,yaml,html,xhtml,xml,vue,eex,php,asp,jsp,smarty
    \ if empty(&foldexpr) | setlocal foldmethod=indent | endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

if has('termguicolors')
    autocmd ColorScheme * set notermguicolors
    autocmd ColorScheme anderson,atom,ayu,base16-*,carbon*,*deep*,flat*,gotham*,*material*,mountaineer*,*-moon,nord*,pyte,quantum,rakr,two-* set termguicolors
    autocmd ColorScheme Greymatters,Oldlace,*day,*-night,bergen,breezy-fall,darktooth,light-kiss,madrid,metalheart,munich,reykjavik,silkworm,soft-*,white-sand
        \ set termguicolors
        \ | highlight! link CursorLineNr LineNr
        \ | highlight! link FoldColumn LineNr
        \ | highlight! link SignColumn LineNr
        \ | highlight! link NonText Comment
endif


" fallback if no third-party color schemes found
if !exists('g:lightline')
    silent! colorscheme slate
    finish
endif


" light line color matching
autocmd ColorScheme * call s:LightLineColorSchemeUpdate()
autocmd VimEnter    * call s:LightLineColorSchemeUpdate()

let s:path = 'autoload/lightline/colorscheme/%s.vim'
let s:palette = 'g:lightline#colorscheme#%s#palette'

function s:LightLineColorSchemeUpdate() abort
    if !exists('g:loaded_lightline') || !exists('g:colors_name')
        return
    endif

    let schemes = [
        \ substitute(g:colors_name, '-', '_', 'g'),
        \ substitute(tolower(g:colors_name), '-', '', ''),
    \ ]
    let schemes += [schemes[0].'_'.&background]
    execute 'runtime' join(map(copy(schemes), 'printf(s:path, v:val)'))
    call filter(schemes, 'exists(printf(s:palette, v:val))')

    let g:lightline.colorscheme =
        \ !empty(schemes)? schemes[0]:
        \ &background == 'light'? 'PaperColor':
        \ g:colors_name =~# '\vatom|base16-|material|-moon|rakr'? 'nord':
        \ g:colors_name =~# '\vmoloka|peaksea|wombat'? 'wombat': 'seoul256'

    set t_Co=256
    call lightline#init()
    call lightline#update()
endfunction


" fallback for ANSI 16-color palettes
let s:colors = &t_Co
if executable('tput')
    let s:colors = system('tput colors')
endif

if s:colors < 88
    silent! colorscheme onedark
    finish
endif

let g:lightline.separator    = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '', 'right': ''}


" theme specific tweaks
let $TERM_ITALICS = 'true'
let g:afterglow_italic_comments = 1
let g:deepspace_italics = 1
let g:enable_bold_font = 1  " hybrid_material
let g:enable_italic_font = 1
let g:gruvbox_italic = 1
let g:jellybeans_use_term_italics = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
let g:oceanic_material_allow_bold = 1
let g:oceanic_material_allow_italic = 1
let g:oceanic_material_allow_reverse = 1
let g:oceanic_material_allow_undercurl = 1
let g:oceanic_material_allow_underline = 1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:one_allow_italics = 1
let g:onedark_terminal_italics = 1
let g:PaperColor_Theme_Options = {'allow_bold': 1, 'allow_italic': 1}
let g:purify_italic = 1
let g:quantum_black = 1
let g:quantum_italics = 1
let g:rehash256 = 1  " molokai
let g:solarized_italics = 1
let g:sonokai_better_performance = 1
let g:sonokai_current_word = 'none'
let g:sonokai_diagnostic_highlight = 1
let g:sonokai_dim_inactive_windows = 1
let g:sonokai_enable_italic = 1

silent! colorscheme iceberg
