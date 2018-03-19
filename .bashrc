# ~/.bashrc #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# General
## Prompt
PS1='[\u@\h \W]\$ '
## Source aliases
[[ -f ~/.bash_aliases ]] && source .bash_aliases
## History
export HISTCONTROL=ignoreboth:erasedups
#export HISTIGNORE=""
