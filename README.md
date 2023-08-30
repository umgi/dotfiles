# dotfiles

## japanese pitch accent

```
notify-send pitch accent for select
called by key combination in sxhkd

script at:
  .local/bin/accent.sh
  .local/bin/accent-dict/*
```

## install

### before

```
$ timedatectl set-ntp true
$ wpa_supplicant -B -i interface -c <(wpa_passphrase 'SSID' 'key')
```

### partition

```
$ fdisk /dev/sda
m - help
p - print
n - add
t - change a partition type
  1 - EFI System 200M / 512M
  19 - Linux Swap - 150%
  20 - Linux Filesystem

uefi only
$ parted /dev/sda -- set <partition> esp on
```


### mkfs

```
$ mkfs.ext4 -L arch /dev/<part>
$ mkfs.fat -F 32 -n boot /dev/<part>
$ mkswap -L swap /dev/<part>
$ swapon /dev/<part>
```

### mounting

```
$ mount /dev/disk/by-label/arch /mnt
$ mkdir /mnt/home
$ mkdir /mnt/boot
$ mount /dev/disk/by-label/boot /mnt/boot
$ mount /dev/disk/by-label/home /mnt/home
```

### install

```
$ genfstab -U /mnt >> /mnt/etc/fstab
$ pacstrap /mnt base base-devel linux linux-firmware linux-headers vim
$ arch-chroot /mnt
$ pacman -S archlinux-keyring # if signatures have been broken
```

### locales

```
$ timedatectl list-timezones | grep <city>
$ ln -sf /usr/share/zoneinfo/<path-before> /etc/localtime
$ hwclock --systohc

$ vim /etc/locale.gen
# or echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
$ locale-gen

$ echo "LANG=en_US.UTF-8" >> /etc/locale.conf
$ echo "archy" >> /etc/hostname

$ vim /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	archy.localdomain	archy
```

### networking

```
pacman -S networkmanager
systemctl enable NetworkManager.service
```

### grub

```
$ pacman -S grub efibootmgr os-prober ntfs-3g 
+ efibootmgr - for uefi system
+ os-prober - if dualboot with windows
+ ntfs-3g - for detecting windows

# installing with windows
$ grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
$ grub-mkconfig -o /boot/grub/grub.cfg

```

### users

```
$ passwd
$ useradd -mG wheel <user>
$ passwd <user>
$ EDITOR="nvim" visudo

%wheel ALL=(ALL) NOPASSWD: ALL
Defaults !tty_tickets
```

### reboot

```
$ exit
$ umount -a
$ reboot
```

### after

```
pacman -Syu xorg-server xorg-xinit noto-fonts git
.config/fontconfig/fonts.conf

cd .config
git clone --bare https://github.com/umgi/dotfiles dotfiles
git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME fetch --all
git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME reset --hard main

pacman -Syu libxft libxinerama zsh

cd ~/.config/dwm ~/.config/dwmblocks ~/.config/st
sudo make install
```

### install yay

```
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R <user>:wheel ./yay
cd yay
makepkg -s
```

### fonts
```
yay -s ttf-rounded-mplus
```

### packages
```
pacman -Syu ack alsa-utils anki dmenu
+ evtest - get raw keyboard data
+ fcitx - japanese ime
+ feh htop mpd mpv
+ unclutter - hides cursor when unused
+ unzip unrar wget xclip xdg-user-dirs xdg-utils
+ xorg-xbacklight - screen brightness
+ xorg-xev - raw xorg pressed key data
+ youtube-dl
```

### audio

```
$ pacman -Syu pulseaudio pamixer ncpamixer
systemctl --user enable pulseaudio
```
