
Debian
====================
This directory contains files used to package parkingd/parking-qt
for Debian-based Linux systems. If you compile parkingd/parking-qt yourself, there are some useful files here.

## parking: URI support ##


parking-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install parking-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your parking-qt binary to `/usr/bin`
and the `../../share/pixmaps/parking128.png` to `/usr/share/pixmaps`

parking-qt.protocol (KDE)

