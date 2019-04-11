HISTCONTROL=ignoreboth
alias git='hub'
alias axel='axel -a'
alias ls='ls -F --color --show-control-chars'
alias la='ls -A'
alias ll='ls -Alh'
alias lt='ls -Alht'
alias md='mkdir -p'
alias pd='pushd'
if [ -x "$(command -v cygpath)" ]; then
    alias pdd='pushd "$(cygpath --desktop)"'
    alias sudo='elevate -wait4idle'
else
    alias pdd='pushd "$(xdg-user-dir DESKTOP)"'
    alias sudo='sudo -E'
fi
