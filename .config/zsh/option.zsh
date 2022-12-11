[ -z "$ZSH_VERSION" ] && exit

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

# List jobs in verbose format by default.
setopt LONG_LIST_JOBS

# Report job execution time and maximum RSS.
export REPORTMEMORY=65536
export REPORTTIME=10
export TIMEFMT="$(print -P %F{247})%P real %*E (user %*U, sys %*S) rss %Mk"


# Changing directories
ZSHZ_CASE="smart"
ZSHZ_DATA="$ZDOTDIR/.z"
ZSHZ_TILDE=1

# Perform cd to a directory if the typed command is invalid, but is a directory.
setopt AUTO_CD

# Make cd push the old directory to the directory stack.
setopt AUTO_PUSHD

# Don't push multiple copies of the same directory to the stack.
setopt PUSHD_IGNORE_DUPS

# Don't print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Have pushd without arguments act like `pushd ${HOME}`.
setopt PUSHD_TO_HOME



# History

# Save each command's beginning timestamp.
setopt EXTENDED_HISTORY

# The maximum number of events stored internally and saved in the history file.
# The former is greater than the latter in case user wants HIST_EXPIRE_DUPS_FIRST.
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=12000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST

# Don't display duplicates when searching the history.
setopt HIST_FIND_NO_DUPS

# Don't enter immediate duplicates into the history.
setopt HIST_IGNORE_DUPS

# Remove older command from the history if a duplicate is to be added.
# setopt HIST_IGNORE_ALL_DUPS

# Remove commands from the history that begin with a space.
setopt HIST_IGNORE_SPACE

# Remove superfluous blank characters from the history command.
setopt HIST_REDUCE_BLANKS

# Remove the "history" built-in itself.
setopt HIST_NO_STORE

# Don't execute the command directly upon history expansion.
setopt HIST_VERIFY

# Provide better locking performance.
setopt HIST_FCNTL_LOCK

# Cause all terminals to share the same history 'session'.
setopt SHARE_HISTORY



# Interactive line editor

# Allow comments starting with `#` in the interactive shell.
setopt INTERACTIVE_COMMENTS

# Prompt for spelling correction of commands.
setopt CORRECT

# GNU Readline behavior
bindkey '^u' backward-kill-line

# Molly-guard, use ^p^m instead
disable r

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_MAXLENGTH=4096

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' expand suffix
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._- ]=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %S%l%s
zstyle ':compinstall'  filename "$ZDOTDIR/option.zsh"
# autoload -Uz compinit
# compinit
# End of lines added by compinstall
