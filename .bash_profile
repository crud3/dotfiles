# ~/.bash_profile #

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Environment variables for i3 etc.
[[ -f ~/.profile ]] && . ~/.profile

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
