[ -z "$BASH_VERSION" ] && exit

export HISTCONTROL=ignoreboth
export PS1='\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
