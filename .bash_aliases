HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'
alias git='hub'
alias axel='axel -a'
alias ls='ls --show-control-chars --color=auto'
alias la='ls -A'
alias ll='ls -Alh'
alias lt='ls -Alht'
alias md='mkdir -p'
alias pd='pushd'
alias pdd='pushd $USERPROFILE/desktop'
alias e.='explorer .'
source /etc/hub.bash_completion.sh
cd ~/projects
cat /etc/motd
