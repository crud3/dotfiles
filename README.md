# System setup
Last tested on Ubuntu 17.10

## i3gaps
After compiling i3gaps, the following packages must be installed:
```git vim gparted i3status i3lock zsh rofi tilda pactl feh scrot arandr xbacklight```

### Media keys
Some media keys are supported by the i3 config (Volume up/down/mute, Brightness up/down). 
The brightness manipulation relies on the ```brightness``` script from the bashscripts repository. 
This script relies on ```xbacklight```, which may need the output device being added in the xorg.conf file. See bashscripts wiki.

## zsh
### oh-my-zsh
Installation
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"```

### powerlevel9k
```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k```

### Font installation
Relevant installed are:
```
Ubuntu Mono derivative Powerline Nerd Font Complete.ttf
DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf
PowerlineSymbols.otf
DejaVu Sans Mono Bold Oblique for Powerline.ttf
Ubuntu Mono derivative Powerline Nerd Font Complete.ttf
DejaVu Sans Mono Bold for Powerline.ttf
DejaVu Sans Mono Oblique for Powerline.ttf
DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf
```
Installing:
```bash
cp [location]/DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf .local/share/fonts/
fc-cache -vf .local/share/fonts
```

## Other packages
```texlive texlive-lang-german texlive-latex-extra texlive-lang-cyrillic texlive-fonts-extra texmaker nautilus-dropbox curl android-tools-adb hunspell hunspell-de-de```

### Dropbox setup
Start with 'dropbox start -i' to automatically download and install daemon

### Installing Zotero from archive
```bash
sudo tar -xvjf Zotero-5.0.35.1_linux-x86_64.tar.bz2 -C /opt
ln -s /opt/Zotero_linux-x86_64/zotero ~/bin
``` 
