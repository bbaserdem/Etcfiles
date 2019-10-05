# Arch Linux Installation Guide

This is my Arch installation guide, specialized to pull from my personal repo.

# Installation

## Create live usb

Install the live-iso either from the torrent, or the mirrors.
Checking the gpg-keys can be made with the following commands;

```
gpg --keyserver-options auto-key-retrieve --verify archlinux-2019.10.01-x86_64.iso.sig
pacman-key -v archlinux-2019.10.01-x86_64.iso.sig
```

To write the live USB (the archiso is compatible with all boot modes)

```
sudo dd if=Downloads/archlinux-20XX.XX.XX-ARCH.iso of=/dev/sdX bs=4M status=progress oflag=sync 
```

Boot from the usb from there.
May need to run `loadkeys dvorak` to work with my intuitive keyboard.

## Filesystem Layout

I use a common filesystem layout, which includes LVM on LUKS for flexibility.

### Clean drives

To clean drives, open an encrypted container and write zeros on top of it.
```
cryptsetup open --type plain /dev/xxx container --key-file /dev/random
dd if=/dev/zero of=/dev/mapper/container bs=1M status=progress
cryptsetup close container
```

### Partition table

Usually, will want to do GPT, with `parted /dev/DRIVE mklabel gpt`.

To create ESP, the following works using gdisk.

```
gdisk /dev/xxx
o
n
1
<Return>
+550M
ef00
```

To create LUKS partitions, only the partition type needs to change

```
gdisk /dev/xxx
o
n
<Return>/<Partition number>
<Return>
<Return>/Disk size
8309
```

### LUKS

LUKS is encryption for the partition map.
To decrypt a luks container, run the following;
```
cryptsetup luksOpen [--key-file /path/to.keyfile] <device> <mapper-name>
```

#### Random keys

Random keys can be generated using

```
dd bs=512 count=4 if=/dev/random of=<OUTPUT_FILE> iflag=fullblock
```

#### Container

To create LUKS containers, the following command should be enough.

```
cryptsetup \
    --cipher aes-xts-plain64 \
    --key-size 512 \
    --hash sha384 \
    --iter-time 2500
    --use-random \
<o> --key-slot X \
    luksformat /dev/xxx2
```

#### Adding keys

To add keys from a keyfile;
```
cryptsetup [--key-slot X] luksAddKey <PART> /path/to.keyfile
```

#### Backup

To create an image of the header as a backup, run
```
fillhere
```

### LVM

LVM allows to be flexible with the partitioning layout.
To create, follow the instructions;
```
pvcreate <device>
vgcreate <group-name> <device>
```

#### Logical Volumes

After LVM is created, create logical volumes either by hard coding the size;
```
lvcreate --size <size;10G> <group-name> --name <volume-name>
```
or by interpolation
```
lvcreate --extent <size;100%FREE> <group-name> --name <volume-name>

```

### Filetypes

#### FAT32

The boot partition should be fat32
```
mkfs.fat -F 32 -n <name> <partition>
```

#### Swap

To declare swap space;
```
mkswap -L Swapspace <device>
swapon <device>
```

#### BTRFS

Formatting partition as btrfs
```
mkfs.btrfs --label <part-label> <device>
```

##### System layout

I use btrfs on the system partition.
The following layout I find to be most beneficial.
These commands assume you are on arch, and the btrfs is on `/dev/Linux/Arch`
```
mount /dev/mapper/Linux-Arch /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@snapshots
umount /mnt

mount -o rw,nodiscard,noatime,nodiratime,compress=lzo,space_cache,subvol=@root /dev/mapper/Linux-Root /mnt
mkdir -p /mnt/{boot,esp,home,.snapshots}
mount -o rw,nodiscard,noatime,nodiratime,compress=lzo,space_cache,subvol=@snapshots /dev/mapper/Linux-Root /mnt/.snapshots
mkdir -p /mnt/var/cache/pacman
mkdir -p /mnt/var/lib
btrfs subvolume create /mnt/var/abs
btrfs subvolume create /mnt/var/cache/pacman/pkg
btrfs subvolume create /mnt/var/lib/machines
btrfs subvolume create /mnt/var/tmp
btrfs subvolume create /mnt/var/log
btrfs subvolume create /mnt/srv
```

I also usually mount the ESP at /esp, and bind mount to /boot

```
mount <partition> /mnt/esp
mkdir -p /mnt/esp/EFI/Arch
mount --bind /mnt/esp/EFI/Arch /boot
```

#### XFS

Use the following command to format a volume as XFS.
Mount will detect the best parameters for XFS.

```
mkfs.xfs -L <partition-label> <volume>
```

## Installation

The installation steps are custom to my personal repo.

### Repositories

To add my own repo to the installation usb, use;

```
cat >>/etc/pacman.conf <<EOF
[sbp]
SigLevel = Optional TrustAll
Server = https://s3.amazonaws.com/sbp-arch/repo
EOF
```

To refresh sources, do a partial update, then update repo list

```
pacman -Sy
pacman -S reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Sy
pacstrap /mnt <MY-PACKAGES>
```



### Etc

To restore etckeeper git files, clone to temp then copy over all files;
```
git clone <REPO> /tmp/etc
cp -r /tmp/etc/. /etc/
```


