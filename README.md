# Arch Setup
## Installation
Standard installation of a wired network system is pretty straightforward following the [installation guide](https://wiki.archlinux.org/index.php/Installation_guide) on the [wiki](https://wiki.archlinux.org/https://www.google.com).
### Disk encryption
For disk encryption, follow the respective [instructions](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Simple_partition_layout_with_LUKS). The mkinitcpio config (see also: [here](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#Boot_loader)) from the wiki required some changes though. It may be necessary to place the block hook before the autodetect. For a system with unencrypted `/boot` partition and encrypted `/root` partition, this worked for me:
```
HOOKS=(base udev block autodetect keyboard modconf encrypt filesystems fsck
```
Install and use the the non-legacy grub (`pacman -S grub`)!
```grub-install --target=i386-pc /dev/sdX```

Required params for `/etc/default/grub` before generating config with `grub-mkconfig -o /boot/grub/grub.cfg`:
```
GRUB_CMDLINE_LINUX="cryptdevice=UUID=<ENCRYPTED-DEVICE-UUID>:cryptroot root=/dev/mapper/cryptroot"
```

## Initial configuration / setup
It's best to follow the Arch Wiki [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations). If the (wired) network connection doesn't work at all, maybe `dhcpcd enp8s0` (TODO make persistent)

First steps on the fresh install as root.
* Add non-root user `useradd -m -s /bin/bash <NAME>` and add to `sudoers` with `visudo` and continue as that user

### Packages
Some packages that will probably be needed / nice to have at some point in the initial configuration
```
git htop openssh xclip base-devel python python2 xorg-font-utils
```
Some required AUR packages (can also be installed when the Xorg is already kind of running)
```
nerd-fonts-complete pulsemixer
```

### Installing and configuring Xorg & i3-gaps
#### Xorg
* When installing `xorg-server`, you may get prompted with:
  ```
  Resolving dependencies...
  :: There are 2 providers available for libgl:
  :: Repository extra
    1) libglvnd 2) nvidia-extra-340xx0utils
  ```
  Chosing [libglvnd](https://github.com/NVIDIA/libglvnd) for now.
* Also installing `xorg-xinit` package to start Xorg via `startx` (`~/.xinitrc` is read by xinit and its frontend `startx`)
  * `startx` and `xinit` commands will try to execute `~/.xserverrc` if it exists, so it makes sense to create it (see [here](https://wiki.archlinux.org/index.php/Xinit#xserverrc))
  * They will also look for a `~/.xinitrc`, so create one from the default to configure it later.
  
  `cp /etc/X11/xinit/xinitrc ~/.xinitrc`
* In this default configuration, xinit will start a basic environment with twm, xclock and xterm, so if your want to start Xorg at this point, it makes sense to install the respective packages if you want to star t it at this point: `xorg-twm xorg-xclock xterm`.

#### i3-gaps
Install community package `i3-gaps` and the other programs used by my i3config (see bashscripts repo). Some packages (i3status, dmenu) are fallbacks required by the default i3 config until I can use my config with my programs. Those could be deleted after the configuration or just kept as fallbacks for darker times.
```
i3blocks i3bar i3lock rofi dmenu terminator zsh tilda feh scrot xorg-xrandr arandr xorg-xbacklight pulseaudio pulseaudio-alsa alsa-utils sysstat archlinux-wallpaper imagemagick
```  
My ZSH setup also requires [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and [powerlevel9k](https://github.com/bhilburn/powerlevel9k).

#### Configure Xorg to automatically start i3
* To automatically start i3 instead of twm when `startx` is called, delete the respective lines in `~/.xinitrc` starting twm and instead put `exec i3` there. The
* After finishing the i3 config and ZSH configurations: Execute `exec startx` when it's a login shell at virtual terminal 1. Because bash is the login shell, this is done in `bash_profile`.

## Setup summary and login startup process
The general setup is as follows:
* No login manager / display manager
* Xorg as display server, started automatically by login shell #1
* i3-gaps as window manager, started automatically by Xorg

Because the login shell is bash, it looks for `~/.bash_profile`, `~/.bash_login`, `~/.profile` in that order and executes the first one it finds, ignoring the rest. The `~/.bashrc` is not executed by login shells, and has to be executed manually if needed.

My startup startup procedure is as follows:

1. Interactive login shell finds `~/.bash_profile` and executes it.
2. `~/.bash_profile` executes `~/.bashrc` for aliases etc.
3. `~/.bash_profile` executes `~/.profile` where environment variables like `$PATH` and `$TERMINAL` are set. Those are used by i3 and other programs.
4. `~/.bash_profile` executes `startx` to start Xorg if it is being executed by a login shell at virtual terminal #1

## After initial setup
After i3-gaps, zsh etc. are configured, installing the following packages
```
firefox thunderbird ranger pcmanfm
```
* When installing firefox, I was prompted with two available providers for `libx264.so=152-64: 1) libx264 2) libx264-10bit`. Chosing the first one. Also chosing `noto-fonts` for `ttf-font`.



---



# Old Ubuntu System setup
Last tested with Ubuntu 17.10 on 2018-03-16

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
