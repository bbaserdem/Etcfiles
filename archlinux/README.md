# Archlinux Guide

Details of installing archlinux.

## Initramfs

Arch uses `mkinitcpio` for kernel image generation.

The following line ensures a working busybox kernel with my setup
```
HOOKS=(base udev autodetect keyboard keymap consolefont modconf block encrypt lvm2 filesystems fsck)
```

Running `mkinitcpio -P` will generate all the initramfs to `/boot/`.

## Booting

The microcode update is installed outside the initrd.
The following kernel parameters are sufficient for booting;
```
initrd=/EFI/Arch/amd-ucode.img
initrd=/EFI/Arch/initramfs-linux.img
rw
cryptdevice=UUID=<UUID>:cryptlvm
root=/dev/Linux/Root
resume=/dev/Linux/Swap
rootflags=subvol=@arch
verbose
```

## Hostname
Set hostname by adding **sbpBLABLABLA** to */etc/hostname*.
Add matching entry (**127.0.1.1 sbplaptop.localdomain sbplaptop**) to */etc/hosts*

## Setup
Run the `setup.sh` to activate neccessary systemd daemons, and further setup.
