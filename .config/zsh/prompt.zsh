# inspired by: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/af-magic.zsh-theme


# the color palette
typeset -AHg FG
for color in {000..255}; do
    FG[$color]="%F{${color}}"
done

local -H \
    _red_="$FG[009]" \
  _steel_="$FG[075]" \
    _sky_="$FG[110]" \
 _orange_="$FG[214]" \
   _gray_="$FG[247]" \
  _reset_='%f'

export LS_COLORS="$LS_COLORS:di=01;38;5;39:ln=01;38;5;37:"


# the primary prompt
PROMPT='$_steel_%(6~|%-3~/…/%2~|%~)'
PROMPT+='${(e)git_info[prompt]}'
if typeset -f 'git_prompt_info' > /dev/null; then
    PROMPT+='$(git_prompt_info)'
fi
if typeset -f 'svn_prompt_info' > /dev/null; then
    PROMPT+='$(svn_prompt_info)'
fi
if typeset -f 'hg_prompt_info' > /dev/null; then
    PROMPT+='$(hg_prompt_info)'
fi
PROMPT+=' %(!.$_red_#.$_sky_»)$_reset_ '


# the secondary prompt
PROMPT2='$_red_\ $_reset_'


# the right prompt
typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1
RPROMPT="${VIRTUAL_ENV:+$_sky_}${VIRTUAL_ENV##*/}${$VIRTUAL_ENV:-%y}"
RPROMPT="$_gray_%n@%m %(?..$_red_)$RPROMPT$_reset_"


# depends on the git-info module to show git information
typeset -gA git_info
if (( ${+functions[git-info]} )); then
    zstyle ':zim:git-info:branch'    format '%b'
    zstyle ':zim:git-info:commit'    format '%c'
    zstyle ':zim:git-info:action'    format ': %s'
    zstyle ':zim:git-info:unindexed' format '*'
    zstyle ':zim:git-info:indexed'   format '+'
    zstyle ':zim:git-info:keys'      format 'prompt' \
        "$_sky_(%b%c%s$_orange_%I%i$_sky_)$_reset_"
    add-zsh-hook precmd git-info
fi
