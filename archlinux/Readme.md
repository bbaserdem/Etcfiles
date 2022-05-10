# Archlinux

This directory contains information and scripts on how I use Archlinux

# Hardware

Packages to auto-configure the computers that I have.
These packages contain `sbp-cmp`, which have configuration for;

* **sbp-cmp-homestation**: My main laptop; which is
[ASUS ROG Strix GL702ZC](https://www.asus.com/us/Laptops/ROG-Strix-GL702ZC/)
* **sbp-cmp-notebook**: My laptop on the go; which is
[System76 Lemur Pro (lemp9)](https://system76.com/laptops/lemur)
* **sbp-cmp-workstation**: My PC at work; which is
[Dell Precision T7500 Tower Workstation](https://www.dell.com/en-us/work/shop/desktop-and-all-in-one-pcs/dell-precision-t7500-tower-workstation/spd/precision-t7500)
* **sbp-cmp-server**: My small form PC meant to be my server; which is
[CompuLab fitlet2](https://fit-iot.com/web/products/fitlet2/) (WIP)

## Homestation

My Homestation; the only reason this is not a physical PC is because I'm mobile.
Here is the [phoronix thread](https://www.phoronix.com/forums/forum/hardware/general-hardware/961327-asus-rog-strix-gl702zc).

### Fan Control

[This phoronix post](https://www.phoronix.com/forums/forum/hardware/general-hardware/961327-asus-rog-strix-gl702zc?p=1054602#post1054602) has info on how to set up fans;

* NBFC is the best bet; since this is a gaming computer.
* The `/opt/nbfc/Plugins/StagWare.Plugins.ECSysLinux.dll` needs to be removed to apply the config.

### CPU crashes

CPU crashes; probably hardware fault.

* [StackExchange](https://serverfault.com/questions/858884/spontaneous-reboot-machine-check-events-amd-ryzen) says disable SMT or OpCache in BIOS.
* [Gentoo Forums](https://forums.gentoo.org/viewtopic-t-1061546.html); bit long read.
* [This kill script](https://github.com/suaefar/ryzen-test) should help troubleshoot.

### Kernel

[Here is a config; but for old linux version.](https://notabug.org/hp/linux-gl702zc)

## Archlinux Server

My home server; I want to use services on here to host my own stuff.
These are all WIP.

### Syncthing
Use syncthing as a file synching service.

### Deluge
Mostly setting up VPN-split tunneling.

So, from what I understand, I can follow [this](https://www.htpcguides.com/force-torrent-traffic-vpn-split-tunnel-debian-8-ubuntu-16-04/) guide. However, I rather use nftables, and arch wiki suggests [this](https://github.com/jonathanio/update-systemd-resolved) script for integrating openvpn and systemd-resolved. So I am on my own on this one.

### Kodi
Use this to stream media accross my devices.

### MPD
Have central access to my music collection, and stream my own music library.

### Webserver
Host a rudimentary website with blogposts and some files.
