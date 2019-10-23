# Nerd fonts
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LINUX_ICON='\uf300' #Arch Symbol

export TERM="xterm-256color"
# Path oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Powerlevel theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, virtualenv)

# Saving pre-oh-my-zsh aliases
saved_aliases=$(alias -L)
source $ZSH/oh-my-zsh.sh
# Delete all aliases, then restore the old ones
unalias -a; eval $saved_aliases; unset saved_aliases

##### ZSH customizations ##### 

## Aliases 
# ZSH has a really weird history function
alias history='history 0'
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -x "$(command -v thefuck)" ]] && eval $(thefuck --alias)

## no beep on error
unsetopt beep
## no beep on history fuckup
unsetopt hist_beep
## Don't enter duplicates of previous event into history
setopt hist_ignore_dups
# Don't display duplicates in line editor, even if duplicates are not contiguos
setopt hist_find_no_dups
# Don't share history
unsetopt share_history
## no beep for failed autocomplete
unsetopt list_beep
## require confirmation for stuff like rm *
unsetopt rm_star_silent

# Powerlevel9k customization

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv command_execution_time background_jobs battery time)

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Only show context when REMOTE or ROOT
DEFAULT_USER=$USER
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false

## Icons
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf113'
POWERLEVEL9K_FOLDER_ICON='\ue5ff' #uf07b

## Colors
#POWERLEVEL9K_OS_ICON_BACKGROUND="21" #66
#POWERLEVEL9k_OS_ICON_FOREGROUND="256"

#POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="9"
#POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="15"

#POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="202"
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="254"

# Context
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="51"
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="19"
#POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="3"
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="4"
#POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="9"
#POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="0"

# Dirs
#POWERLEVEL9K_DIR_HOME_BACKGROUND='39'
#POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='39'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='233'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='12'
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='15'

# Battery
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='9'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='15'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='28'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='0'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='10'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='0'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='241'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='15'

