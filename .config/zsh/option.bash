[ -z "$BASH_VERSION" ] && exit

export HISTCONTROL=ignoreboth
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
