# SarahMiaOverlay

**Budgie**

Budgie is the default desktop of Solus Operating System, written from scratch. Besides a more modern design, Budgie can emulate the look and feel of the GNOME 2 desktop.

This overlay contains both the budgie-desktop, extras and applets for budgie desktop. Everything that is needed to run budgie-desktop.
budgie-extras add a lot of applets and helper applications.

For more information about budgie you can visit: https://github.com/solus-project/budgie-desktop/blob/master/README.md

After merging budgie-extras please start the Window Shuffler, some applets will require this (hotcorners mostly). This can be done with the provided Window Shuffler application in your applications list/menu. You can set additional options there as well.
The config for the new window preview from budgie-extras (for alt-tab) is in the Previews Control in your applications list/menu. You can set additional options there as well.

**Other**

This overlay contains a few other packages that either fixes or adds unlisted versions/features elsewhere.

## Installation:

**Overlay**

To add the overlay to portage run the following: (assuming you have eselect-repository installed)

	eselect repository enable SarahMiaOverlay

**Budgie**

To install budgie desktop you need to add budgie to your accept_keywords. For 10.5.3 you need to do the same for the screensaver which will get pulled in by default. Then you can emerge budgie-desktop

	
	echo 'gnome-extra/budgie-desktop' >> /etc/portage/package.accept_keywords/budgie-desktop
	emerge --ask --verbose budgie-desktop
	

After that is done you can just select the budgie-desktop session from your favorite login manager. Budgie by itself favors lightdm with slick-greeter or gtk-greeter, but is not limited to any.

Budgie by itself comes pretty barebones. I recommend you find application for the following parts along with my personal recommendation:

- Basic desktop icons (home/trash/mounted etc) with budgie-desktop-view (or you can let e.g. nemo do this if you want instead)
- File Manager (nemo, will also add desktop icons if you want that)
- Image Viewer (eog - eye of gnome)
- The usual browser, audio and video players and other applications you want to use
- Any gtk/gnome application you want to use since budgie-desktop is based on gnome and uses gtk
	- NOTE: gnome shell extensions will not work. Use budgie-applets for that
	- Anything for gnome-shell only will not work

To personalise your desktop:

- Gnome Tweaks for additional settings
- Budgie Extras for more applets. Other applets can be found as budgie-\*-applet in the overlay
- Change settings in the following applications:
	- Gnome Control Center
	- Budgie Desktop Settings
	- (Part of budgie-extras) Window Shuffler Control (tiling/grid support)
	- (Part of budgie-extras) WallStreet Control (rotating wallpapers)
	- (Part of budgie-extras) Previews Control (display applications preview while alt-tabbing)

## Notes:

If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

1) the idea-community ebuild was added due to the gentoo mainline 2021.3.1 version actually installs 2020.3.1 version. This may cause it to look like a downgrade when installing 2021.1.1 version. Please note that you can prevent that by having the following line in your package.use file or subfile:

    */etc/portage/package.accept_keyword{/idea-community}*

    ```
	# Only installs idea 2021.1 version without making the mainline gentoo idea-community ebuild look like an upgrade
	=dev-util/idea-community-2021.1.1.211.7142.45
	```

	If you are unsure of which version you are running please go help/about menu inside the IDE.

2) If you are using budgie-desktop version 10.5.2 then budgie-screensaver may not work. This due to budgie-desktop-5.10.2 relies on gnome-screensaver which isn't in portage anymore since sometime 2020. Therefor using that version will prevent you from locking your desktop. Only logout will work for locking but will cause you to loose your session. Please upgrade to budgie-desktop-5.10.3 which does support budgie-screensaver. At that point you can lock your screen.

3) If there is an applet/software/theme you want let me know with a link and I will see if I can add it in the overlay for you.

### Todo:

- Make a separate document for further tweaks of budgie-desktop if wanted. (e.g. not showing nm-applet tray icon if using the network applet from budgie-extras)
- Look into specific budgie themes maybe.
- Thinking about adding a meta ebuild for all the applets.
- Look into idea-community to see if it is still relevant since it looks like it got fixed in the mainline gentoo repo.