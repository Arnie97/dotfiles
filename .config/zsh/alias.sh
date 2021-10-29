export CLICOLOR=1
export DISPLAY="${DISPLAY:-:0}"
export GPG_TTY="${GPG_TTY:-$(tty)}"
export HOMEBREW_NO_AUTO_UPDATE=1
export LESS="-iFRSX"
export NNN_OPTS="AcCdn"
export NNN_OPENER="nnn-xargs"

alias -- -='cd -'
alias c='cargo'
alias d='docker'
alias g='git'
alias axel='axel -a'
alias ag='ag --pager=less'
alias ip='ip --color=auto'
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
    mkdir -p "$1" && chdir "$1" && shift && [ $# -ne 0 ] && mkdir -p "$@"
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
