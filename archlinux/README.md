# Arch packages

This directory contains my main pkgbuild to manage 

# System

Packages to build the operating system
This directory contains `sbp-sys`, which have;

* **sbp-sys-base**: Common package to get system running.
* **sbp-sys-extra**: Programs I don't neccessarily need for things.
* **sbp-sys-uefi**: Programs for booting UEFI compliant systems.
* **sbp-sys-virtual**: Programs I need to run virtual OS's.

All the packages here are dependent on the base one.
Base package requites a boot and an init implementation.
The implementations themselves are mutually exclusive.

# Gui

This directory contains `sbp-gui`, which has;

* **sbp-gui-base**: Common gui programs and libraries
* **sbp-gui-extra**: Common gui programs and libraries
* **sbp-gui-sway**: Sway desktop (for wayland)
* **sbp-gui-bspwm**: Bspwm desktop
* **sbp-gui-games**: Packages to run Steam and other games.

All packages are dependent on the base one.
Between themselves, they have no interdependence.

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
