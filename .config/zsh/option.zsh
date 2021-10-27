[ -z "$ZSH_VERSION" ] && exit


# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

# GNU Readline behavior
bindkey '^u' backward-kill-line


# zsh-history-substring-search

# Molly-guard, use ^p^m instead
disable r

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# zsh-autosuggestions

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
ZSHZ_DATA="$ZDOTDIR/.z"


# zsh-syntax-highlighting

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'


# Changing directories

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

# The maximum number of events stored internally and saved in the history file.
# The former is greater than the latter in case user wants HIST_EXPIRE_DUPS_FIRST.
HISTSIZE=20000
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

# Don't execute the command directly upon history expansion.
setopt HIST_VERIFY

# Cause all terminals to share the same history 'session'.
setopt SHARE_HISTORY

#
# Input/output
#

# Allow comments starting with `#` in the interactive shell.
setopt INTERACTIVE_COMMENTS

#
# Job control
#

# List jobs in verbose format by default.
setopt LONG_LIST_JOBS

# Prevent background jobs being given a lower priority.
setopt NO_BG_NICE

# Prevent status report of jobs on shell exit.
setopt NO_CHECK_JOBS

# Prevent SIGHUP to jobs on shell exit.
setopt NO_HUP

# Prompt for spelling correction of commands.
setopt CORRECT

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
