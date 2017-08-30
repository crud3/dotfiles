# dotfiles
## ZSH
## Installation of i3 under Ubuntu MATE 16.04
  Works for Ubuntu 16.04.3 LTS (Xenial) x86_64 / MATE Desktop Environment 1.12.1
  1. Install i3
  
     ``` sudo apt-get install i3 ```
  2. Launch dconf-editor to set the following vars
  
      | Path | key | value/action
      | ------ | ------ | ------ |
      | org.mate.desktop.session.required-components | windowmanager | i3 |
      | org.mate.desktop.session | required-components-list | delete 'filemanager' from array |
      | org.mate.desktop.background | draw-background | false |
      | org.mate.desktop.background | show-desktop-icons | false |
      
      1st should be clear
      
      2nd is to prevent MATE from opening a full-size floating window for the desktop on startup
      
      3rd and 4th are to enable the opening of caja from cli without opening the whole desktop (see 2nd)
  2. Log off and on, then complete i3 config wizard (or not if you already have a config file)
  3. It seems to be the easiest way to not use caja with i3, nautilus works instead
  
     ```
     sudo apt-get install nautilus
     sudo apt-get remove caja
     ```
     Also install the following packages to open a terminal via right click in nautilus:
     
     ```
     sudo apt-get install nautilus-actions
     sudo apt-get remove gnome-terminal
     ```
  
  4. Delete Bottom Panel
