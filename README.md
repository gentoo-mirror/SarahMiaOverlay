# SarahMiaOverlay

**Budgie**

Budgie is the default desktop of Solus Operating System, written from scratch. Besides a more modern design, Budgie can emulate the look and feel of the GNOME 2 desktop.

This overlay contains both the budgie-desktop, extras and applets for budgie desktop. Everything that is needed to run budgie-desktop.
budgie-extras add a lot of applets and helper applications.

For more information about budgie you can visit: https://github.com/BuddiesOfBudgie/budgie-desktop/blob/master/README.md

After merging budgie-extras please start the Window Shuffler, some applets will require this (hotcorners mostly). This can be done with the provided Window Shuffler application in your applications list/menu. You can set additional options there as well.
The config for the new window preview from budgie-extras (for alt-tab) is in the Previews Control in your applications list/menu. You can set additional options there as well.

**Other**

This overlay contains 1 other package that will be removed in the future, making this repository budgie only. Ebuilds not related to budgie may be added later if needed but is unlikely.

## Installation:

**Overlay**

To add the overlay to portage run the following: (assuming you have eselect-repository installed)

	eselect repository enable SarahMiaOverlay

**Option 1: Budgie Desktop Base**

To install budgie desktop by itself you don't need to do anything special other than the command below (basic emerge command). Then you can emerge budgie-desktop as you would with any other package.

	emerge --ask --verbose budgie-desktop
	

After that is done you can just select the budgie-desktop session from your favorite login manager. Budgie by itself favors lightdm with slick-greeter or gtk-greeter, but is not limited to any.

*Budgie-desktop-10.6 notice:* Since these being fresh release along with other associated software they will be in 'testing' to make sure there are no dire issues in regards to stability and compatability in regards to other software. And that the ebuilds also function as intended. With patch releases later coming it will be made with stable keywords in due time. for a while. To install this version please unmask by adding them to the keywords directory of portage config;

	echo 'gnome-extra/budgie-desktop' >> /etc/portage/package.accept_keywords/budgie-desktop
	echo 'gnome-extra/budgie-screensaver' >> /etc/portage/package.accept_keywords/budgie-desktop

**option 2: Budgie Meta Package**

Another option is installing budgie-meta. This is a meta package that contains budgie-desktop and screensaver as required, but also includes budgie-desktop-view, budgie-control-center and budgie-extras.
Since all of these packages contains versions that are very new, you need to unmask this. To install this package follow the following steps;

	echo 'gnome-extra/budgie-meta' >> /etc/portage/package.accept_keywords/budgie-desktop
	echo 'gnome-extra/budgie-desktop' >> /etc/portage/package.accept_keywords/budgie-desktop
	echo 'gnome-extra/budgie-screensaver' >> /etc/portage/package.accept_keywords/budgie-desktop
	echo 'gnome-extra/budgie-desktop-view' >> /etc/portage/package.accept_keywords/budgie-desktop
	echo 'gnome-extra/budgie-control-center' >> /etc/portage/package.accept_keywords/budgie-desktop
	echo 'gnome-extra/budgie-extras' >> /etc/portage/package.accept_keywords/budgie-desktop
	emerge --ask --verbose budgie-meta

*Later on this will be made without ~arch keyword after a while to ensure full stability*

**Budgie extra applets and applications**

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
	- Budgie-Control-Center or Gnome Control Center
	- Budgie Desktop Settings
	- (Part of budgie-extras) Window Shuffler Control (tiling/grid support)
	- (Part of budgie-extras) WallStreet Control (rotating wallpapers)
	- (Part of budgie-extras) Previews Control (display applications preview while alt-tabbing)

## Updates:

**2022/04/09)** budgie-desktop-10.6.1, budgie-screensaver-5.0.1, budgie-meta-10.6.1, budgie-control-center-1.0.1 are all added. Appstream updated with new ~ppc keyword.

**2022/04/06)** budgie-desktop-10.5.3-r2 and budgie-desktop-view-1.1.1 are made stable. Readme updated to clarify some stuff regarding keywords.

**2022/03/15)** budgoe-desktop-10.6, budgie-screensaver-5.0, budgie-extras-1.4.0 and budgie-desktop-view-1.2 have been added. budgie-extras-1.2.0 has been removed.

**2022/01/17)** budgie-desktop-10.5.3-r1 added with mutter 9 support for those running unstable gnome41.3+ version. Removed old version of budgie-desktop. Budgie-extras-1.3.0 made stable.

**2021/12/15)** Budgie-desktop and budgie-screensaver been made stable due to not getting any reports. Budgie-extras will be set to stable later mid january if nothing changes. At the same time budgie-desktop version 10.5.2 will be removed as it has become obsolete.

**: Unstable/stable refers to keywords in regards to e.g. x86/amd64 vs ~x86/~amd64 !

## Notes:

1) If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

2) If you want a specific applet/software/theme/etc that is budgie-desktop related feel free to make a request, I will see what I can do to get it added to the overlay.

3) If there is an applet/software/theme you want let me know with a link and I will see if I can add it in the overlay for you.

4) I will keep appstream updated in sync with the main line gentoo tree. This usually happens within a few days at most from any mainline update.

### Possible Todo's:

- (medium) Mid to end may push meta-10.6.1 and all contents to stable if no issues arise.
- (medium) Assuming above done, 1 month later removing old ebuilds.
- (unlikely) Make a separate document for further tweaks of budgie-desktop if wanted. (e.g. not showing nm-applet tray icon if using the network applet from budgie-extras)
- (unlikley) Look into specific budgie themes maybe.
