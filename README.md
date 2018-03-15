# Ubuntu System setup
## i3gaps
After compiling i3gaps, the following packages must be installed:

Ubuntu:
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

# Arch installation
Standard installation of a wired network system is pretty straightforward following the [installation guide](https://wiki.archlinux.org/index.php/Installation_guide) on the [wiki](https://wiki.archlinux.org/https://www.google.com).
## Disk encryption
For disk encryption, follow the respective [instructions](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Simple_partition_layout_with_LUKS). The mkinitcpio config (see also: [here](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#Boot_loader)) from the wiki required some changes though. It may be necessary to place the block hook before the autodetect. For a system with unencrypted `/boot` partition and encrypted `/root` partition, this worked for me:
```sh
HOOKS=(base udev block autodetect keyboard modconf encrypt filesystems fsck
```
Install and use the the non-legacy grub (`pacman -S grub`)!
Grub installation (MBR): `grub-install --target=i386-pc /dev/sdX`
Required params for `/etc/default/grub` before generating config with `grub-mkconfig -o /boot/grub/grub.cfg`:
```sh
GRUB_CMDLINE_LINUX="cryptdevice=UUID=<ENCRYPTED-DEVICE-UUID>:cryptroot root=/dev/mapper/cryptroot"
```

## First steps
It is advised to roughly follow the Arch Wiki [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations). If the (wired) network connection doesn't work at all, maybe `dhcpcd enp8s0` (TODO make persistent)
My first steps on the fresh install as root.
* Install sudo and vim `pacman -S sudo vim`
* Add non-root user `useradd -m -s /bin/bash <NAME>` and add to `sudoers` with `visudo`

## Packages
Some packages that will probably be needed at some point
```
git openssh xclip base-devel python python2 xorg-font-utils
```
### AUR packages
Some required AUR packages
```
nerd-fonts-complete pulsemixer
```

### Xorg
* When installing `xorg-server`, you may get prompted with:
  ```
  Resolving dependencies...
  :: There are 2 providers available for libgl:
  :: Repository extra
    1) libglvnd 2) nvidia-extra-340xx0utils
  ```
* Chosing [libglvnd](https://github.com/NVIDIA/libglvnd) for now.
* Also installing `xorg-xinit` package to start Xorg via `startx` (`~/.xinitrc` is read by xinit and its frontend `startx`)
  * `startx` and `xinit` commands will try to execute `~/.xserverrc` if it exists, so it makes sense to create it (see [here](https://wiki.archlinux.org/index.php/Xinit#xserverrc))
  * They will also look for a `~/.xinitrc`, so create one from default to configure it later.
  
  `cp /etc/X11/xinit/xinitrc ~/.xinitrc`
* In this default configuration, xinit will start a basic environment with twm, xclock and xterm, so if your want to start Xorg at this point, it makes sense to install the respective packages: `xorg-twm xorg-xclock xterm`.

### i3-gaps and utils
Install community package `i3-gaps` and the other programs used by my i3config (see bashscripts repo). Some packages (i3status, dmenu) are fallbacks required by the default i3 config until I get my config with my programs to work. Those could be deleted later or just kept as fallbacks for darker times.
```
dmenu i3blocks i3bar i3lock zsh rofi tilda feh scrot xorg-xrandr arandr xorg-xbacklight pulseaudio pulseaudio-alsa
```  
* When installing firefox, I was prompted with two available providers for `libx264.so=152-64: 1) libx264 2) libx264-10bit`. Chosing the first one. Also chosing `noto-fonts` for `ttf-font`.

### Configure Xorg to use i3
* To automatically start i3 instead of twm when `startx` is called, comment out the lines in `~/.initrc` starting twm and instead put `exec i3` there.
* After finishing the necessary i3 config and ZSH configurations: Execute `exec startx` when it's a login shell at virtual terminal 1 in`~/.profile`.

### General configurations
* Set zsh to default shell `chsh -s $(which zsh)`
* ZSH has some wrong keybindings for me on a fresh arch install (zsh does *not* read `/etc/inputrc` or `~/.inputrc`, it has an own line editor0 , so I will probably have to fix them as keybindings in the `.zshrc`

