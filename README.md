# System setup
Last tested on Ubuntu 17.10

## i3gaps
After compiling i3gaps, the following packages must be installed:

```
git vim i3status i3lock i3blocks zsh rofi tilda pactl feh scrot arandr xbacklight
```

### Scripts
Bash scripts from the bashscripts repository must be installed for full functionality.

### Media keys
Some media keys are supported by the i3 config (Volume up/down/mute, Brightness up/down). 
The brightness manipulation relies on the ```brightness``` script from the bashscripts repository. 
This script relies on ```xbacklight```, which may need the output device being added in the xorg.conf file. See bashscripts wiki.

## zsh
### oh-my-zsh
Installation
```sh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

### powerlevel9k

```sh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

### Font installation

Manual font installation:

Copy the font to the respective font dir in ~/.local/share/fonts or /usr/share/fonts and then rebuild the font cache

```sh
mkdir -p ~/.local/share/fonts/NerdFonts
cp Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts/NerdFonts/
fc-cache -vf ~/.local/share/fonts
```

It is also possible to clone the nerdfonts repo and use the install script

```sh
git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git && cd nerd-fonts
./install.sh DroidSansMono
```

## Other packages
```
texlive texlive-lang-german texlive-latex-extra texlive-lang-cyrillic texlive-fonts-extra texmaker gparted nautilus-dropbox curl android-tools-adb hunspell hunspell-de-de pandoc
```

### Dropbox setup
Start with 'dropbox start -i' to automatically download and install daemon

### Installing Zotero from archive
```sh
sudo tar -xvjf Zotero-5.0.35.1_linux-x86_64.tar.bz2 -C /opt
ln -s /opt/Zotero_linux-x86_64/zotero ~/bin
``` 
