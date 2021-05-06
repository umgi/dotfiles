# dotfiles

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
$ pacman -S grub efibootmgr os-prober
+ efibootmgr - for uefi system
+ os-prober - if dualboot with windows

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
pacman -Syu xorg-server xorg-xinit noto-fonts
.config/fontconfig/fonts.conf
```
