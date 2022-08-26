ZIM_HOME="$ZDOTDIR"

if [ -f "$ZIM_HOME/zimfw.zsh" -o -f "$ZIM_HOME/init.zsh" ]; then
    # Update static initialization script if it does not exist or it's outdated
    if [[ ! "$ZIM_HOME/init.zsh" -nt "$ZDOTDIR/.zimrc" ]]; then
        source "$ZIM_HOME/zimfw.zsh" init -q
    fi
    source "$ZIM_HOME/init.zsh"

    # Compile scripts into bytecode
    if [[ -o login ]]; then
        source "$ZIM_HOME/recompile.zsh" -q &!
    fi
fi

source "$ZDOTDIR/alias.sh"
source "$ZDOTDIR/option.zsh"
source "$ZDOTDIR/initials.zsh"
source "$ZDOTDIR/prompt.zsh"
