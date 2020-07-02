export DISPLAY=:0
export PATH="$HOME/.local/bin:$PATH"
export LESS="-FRSX"

alias git='hub'
alias axel='axel -a'
alias ag='ag --pager=less'
alias ls='ls -F --color --show-control-chars'
alias la='ls -A'
alias ll='ls -Alh'
alias lt='ls -Alht'
alias md='mkdir -p'
alias rd='rmdir'
alias pd='pushd'

if [ -x "$(command -v cygpath)" ]; then
    alias pdd='pushd "$(cygpath --desktop)"'
    alias sudo='elevate -wait4idle'
else
    alias pdd='pushd "$(xdg-user-dir DESKTOP)"'
    alias sudo='sudo -E'
fi

ccd() {
    mkdir -p "$1" && chdir "$1" && shift && [ $# -ne 0 ] && mkdir -p "$@"
}

if [ -n "$BASH_VERSION" ]; then
    export HISTCONTROL=ignoreboth
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
elif [ -n "$ZSH_VERSION" ]; then
    setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_DUPS HIST_IGNORE_SPACE
    bindkey "^u" backward-kill-line
fi
