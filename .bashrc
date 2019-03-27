# ~/.bashrc #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# General
## Prompt
PS1='[\u@\h \W]\$ '
## Source aliases
[[ -f ~/.bash_aliases ]] && source .bash_aliases

#Adjust window size
shopt -s checkwinsize

# History
export HISTCONTROL=ignoreboth:erasedups
#export HISTIGNORE=""
export HISTSIZE=1000
export HISTFILESIZE=10000
shopt -s histappend

# ns-3 bake stuff
if [ -d "$HOME/dev/ns3/bake" ] ; then
    export BAKE_HOME="$HOME/dev/ns3/bake"
    export PATH=$PATH:$BAKE_HOME
    export PYTHONPATH=${PYTHONPATH:+:${PYTHONPATH}}$BAKE_HOME:$BAKE_HOME/build/lib
fi

