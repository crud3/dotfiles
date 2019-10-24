# Aliases
## Enable aliases for sudo
alias='sudo '

## Movements / ls
alias ..='cd ..'
alias ...='cd ../..'

alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
# Show only hidden files and dirs
alias lh='ls -ld .?*'

## Misc
alias please=sudo
alias fucking=sudo
alias doch='sudo $(fc -ln -1)'
alias dog=cat

alias myip="curl http://ipecho.net/plain; echo"

## History
alias h='fc -l 1'
alias hs='history | grep'

## Directories
alias mkdir='mkdir -pv'
# make dir and cd into
mcd () { mkdir -p $1 && cd $1; }
# make random dir in /tmp and cd into
mcr () { mcd "/tmp/$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10 ; echo '')" }
alias rd=rmdir

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Copy content of argument to clipboard
alias fclip='xclip -sel c <'

# Search processes with argument, e.g. 'psg bash'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

## Git
alias gst='git status -sb'
alias gsta='git status'
alias gcf='git config --list'
alias ga='git add'
alias gd='git diff'
alias gc='git commit -v -m'
alias gp='git push'
alias gl='git pull'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gco='git checkout'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias glog='git log --oneline --decorate --graph'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'

## Python
# version on Ubuntu
alias python='python3'
# venv
activate () {
    if [[ -d venv ]] ; then
        source ./venv/bin/activate
    elif [[ -d .venv ]] ; then
        source ./.venv/bin/activate
    else
        echo "No venv found!"
        return 1
    fi 
}

## gnome-control-center with i3
alias gnome-control-center='XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
