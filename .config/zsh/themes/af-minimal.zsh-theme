# inspired by: https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/af-magic.zsh-theme


# the color palette
local -H \
    _red_="$FG[009]" \
  _steel_="$FG[075]" \
    _sky_="$FG[110]" \
 _orange_="$FG[214]" \
   _gray_="$FG[247]" \
  _reset_="%{$reset_color%}"

export LS_COLORS="$LS_COLORS:di=01;38;5;39:ln=01;38;5;37:"


# the primary prompt
PROMPT='$_steel_%(6~|%-3~/…/%2~|%~)'
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
if type "virtualenv_prompt_info" > /dev/null; then
	RPROMPT='${$(virtualenv_prompt_info):-%y}'
else
	RPROMPT='%y'
fi
RPROMPT="$_gray_%n@%m %(?..$_red_)$RPROMPT$_reset_"


# version control settings
declare \
{\
ZSH_THEME_GIT_PROMPT_PREFIX,\
ZSH_THEME_SVN_PROMPT_PREFIX,\
ZSH_THEME_HG_PROMPT_PREFIX\
}="$_sky_(" \
\
{\
ZSH_THEME_GIT_PROMPT_CLEAN,\
ZSH_THEME_SVN_PROMPT_CLEAN,\
ZSH_THEME_HG_PROMPT_CLEAN\
}="" \
\
{\
ZSH_THEME_GIT_PROMPT_DIRTY,\
ZSH_THEME_SVN_PROMPT_DIRTY,\
ZSH_THEME_HG_PROMPT_DIRTY\
}="$_orange_*$_reset_" \
\
{\
ZSH_THEME_GIT_PROMPT_SUFFIX,\
ZSH_THEME_SVN_PROMPT_SUFFIX,\
ZSH_THEME_HG_PROMPT_SUFFIX\
}="$_sky_)$_reset_"


# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX="%(?.$_sky_.$_red_)["
ZSH_THEME_VIRTUALENV_SUFFIX="]$_reset_"
