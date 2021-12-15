# vim: ft=zsh et ts=4 sw=0
# inspired by: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/af-magic.zsh-theme


# the color palette
typeset -gA _fg
   _fg[red]='%F{009}'
 _fg[steel]='%F{075}'
   _fg[sky]='%F{110}'
_fg[orange]='%F{214}'
  _fg[gray]='%F{247}'

export LS_COLORS="$LS_COLORS:di=01;38;5;39:ln=01;38;5;37:"


# the primary prompt
setopt PROMPT_{SUBST,PERCENT}
PROMPT="$_fg[steel]%(6~|%-3~/…/%2~|%~)"
PROMPT+='${(e)git_info[prompt]}'
PROMPT+=" %(!.$_fg[red]#.$_fg[sky]»)%f "


# the secondary prompt
PROMPT2="$_fg[red]\ %f"


# the right prompt
typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1
RPROMPT="$_fg[gray]%n@%m "
RPROMPT+='%(?.${VIRTUAL_ENV:+$_fg[sky]}.$_fg[red])${${VIRTUAL_ENV##*/}:-%y}%f'


# depends on the git-info module to show git information
typeset -gA git_info
if (( ${+functions[git-info]} )); then
    zstyle ':zim:git-info:branch'    format '%b'
    zstyle ':zim:git-info:commit'    format '%c'
    zstyle ':zim:git-info:action'    format ': %s'
    zstyle ':zim:git-info:unindexed' format '*'
    zstyle ':zim:git-info:indexed'   format '+'
    zstyle ':zim:git-info:keys'      format 'prompt' \
        "$_fg[sky](%b%c%s$_fg[orange]%I%i$_fg[sky])%f"
    add-zsh-hook precmd git-info
fi
