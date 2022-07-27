export CLICOLOR=1
export GPG_TTY="${GPG_TTY:-$(tty)}"
export HOMEBREW_NO_AUTO_UPDATE=1
export LESS="-iFRSX"
export NNN_OPTS="AcCdn"
export NNN_OPENER="nnn-xargs"
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export RUST_BACKTRACE=1

alias -- -='cd -'
alias c='cargo'
alias d='docker'
alias g='git'
alias y='rlwrap yaegi'
alias axel='axel -a'
alias ag='ag --pager=less'
alias lb='lsblk -So+SERIAL && echo && lsblk -o NAME,FSTYPE,SIZE,FSAVAIL,LABEL,MOUNTPOINT'
alias ls='ls -F'
alias la='ls -A'
alias ll='ls -Alh'
alias lt='ls -Alht'
alias md='mkdir -p'
alias rd='rmdir'
alias pd='pushd'

# coreutils
if ls --version > /dev/null 2>&1; then
    alias ls='ls -F --color --show-control-chars'
fi

# iproute2
if ip --color netns > /dev/null 2>&1; then
    alias ip='ip --color=auto'
fi

if [ -x "$(command -v hub)" ]; then
    alias git='hub'
fi

if [ -x "$(command -v cygpath)" ]; then
    alias pdd='pushd "$(cygpath --desktop)"'
    alias sudo='elevate -wait4idle'
elif [ -x "$(command -v xdg-user-dir)" ]; then
    alias pdd='pushd "$(xdg-user-dir DESKTOP)"'
    alias sudo='sudo -E'
else
    alias pdd='pushd "$HOME/Desktop"'
    alias sudo='sudo -E'
fi

ccd() {
    mkdir -p "$1" && cd "$1" && shift && [ $# -ne 0 ] && mkdir -p "$@"
}

n () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # Configure cd on quit
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
