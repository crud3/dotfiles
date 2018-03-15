# Ubuntu System setup
## i3gaps
After compiling i3gaps, the following packages must be installed:

Ubuntu:
```
git vim i3status i3lock i3blocks zsh rofi tilda pactl feh scrot arandr xbacklight
```
Arch:
```
git vim i3status i3lock i3blocks zsh rofi tilda pulseaudio feh scrot xrandr arandr xorg-xbacklight
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
Install and use the the non-legacy grub! Required params for `/etc/default/grub` before generating config with `grub-mkconfig -o /boot/grub/grub.cfg`:
```sh
GRUB_CMDLINE_LINUX="cryptdevice=UUID=<ENCRYPTED-DEVICE-UUID>:cryptroot root=/dev/mapper/cryptroot"
```
Grub installation (MBR): `grub-install --target=i386-pc /dev/sdX`

## First steps
It makes sense to roughly follow the Arch Wikiw [General recommendations](https://wiki.archlinux.org/index.php/General_recommendations). If the (wired) network connection doesn't work at all, maybe `dhcpcd enp8s0`
My first steps on the fresh install as root.
* Install sudo and vim `pacman -S sudo vim`
* Add non-root user `useradd -m -s /bin/bash <NAME>` and add to `sudoers` with `visudo`
