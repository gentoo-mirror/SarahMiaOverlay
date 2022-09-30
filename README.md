# SarahMiaOverlay

**Budgie**

Budgie is the default desktop of Solus Operating System, written from scratch. Besides a more modern design, Budgie can emulate the look and feel of the GNOME 2 desktop.

This overlay contains both the budgie-desktop, extras and applets for budgie desktop. Everything that is needed to run budgie-desktop.
budgie-extras add a lot of applets and helper applications.

For more information about budgie you can visit: https://github.com/BuddiesOfBudgie/budgie-desktop/blob/master/README.md

After merging budgie-extras please start the Window Shuffler, some applets will require this (hotcorners mostly). This can be done with the provided Window Shuffler application in your applications list/menu. You can set additional options there as well.
The config for the new window preview from budgie-extras (for alt-tab) is in the Previews Control in your applications list/menu. You can set additional options there as well.

*please note that the ~arm ~arm64 keywords on a number of ebuilds are in testing, budgie itself says either intel or amd cpu's needed but there is an arm tweak tool hence the keywords for testing purposes! If it doesn't work out I will remove these keywords.*

**Other**

This overlay contains 1 other package that will be removed in the future, making this repository budgie only. Ebuilds not related to budgie may be added later if needed but is unlikely.

## Installation:

**1) Overlay**

To add the overlay to portage run the following: (assuming you have eselect-repository installed)

	eselect repository enable SarahMiaOverlay

**2a) Option 1: Budgie Desktop Base**

To install budgie desktop by itself you don't need to do anything special other than the command below (basic emerge command). Then you can emerge budgie-desktop as you would with any other package.

	emerge --ask --verbose budgie-desktop
	

After that is done you can just select the budgie-desktop session from your favorite login manager. Budgie by itself favors lightdm with slick-greeter or gtk-greeter, but is not limited to any.

**2b) option 2: Budgie Meta Package**

Another option is installing budgie-meta. This is a meta package that contains budgie-desktop and screensaver as required, but also includes budgie-desktop-view, budgie-control-center and budgie-extras.

	emerge --ask --verbose budgie-meta
	
When going for ~ keywords you may need to unmask most packages. But it is the latest version.

**3) Personalize Budgie Destop with extra applets and applications**

Budgie by itself comes pretty barebones. I recommend you find application for the following parts along with my personal recommendation:

- Merge Budgie Extras for more applets. Other applets can be found as budgie-\*-applet in the overlay
- Basic desktop icons (home/trash/mounted etc) with budgie-desktop-view (or you can let e.g. nemo do this if you want instead)
- File Manager (nemo, will also add desktop icons if you want that)
- Image Viewer (eog - eye of gnome)
- The usual browser, audio and video players and other applications you want to use
- Any gtk/gnome application you want to use since budgie-desktop is based on gnome and uses gtk
	- NOTE: gnome shell extensions will not work. Use budgie-applets for that
	- Anything for gnome-shell only will not work

To personalise your desktop:

- Gnome Tweaks for additional settings
- Change settings in the following applications:
	- Budgie-Control-Center or Gnome Control Center
	- Budgie Desktop Settings
	- (Part of budgie-extras) Window Shuffler Control (tiling/grid support)
	- (Part of budgie-extras) WallStreet Control (rotating wallpapers)
	- (Part of budgie-extras) Previews Control (display applications preview while alt-tabbing)

## Notes:

1) Absolute latest versions are being added as unstable outside the current meta build till budgie-backgrounds is done and a budgie-extras-1.5 is released. If you want these versions already you can do so but only through unmasking them with ~xxxxx keywords (what your system uses). 

2) ~arm and ~arm64 keywords added to a number of ebuilds (mostly those in meta) for testing purposes. Since budgie does an ARM tweak tool separately. Do let me know if anything comes up with this or if stuff don't work.

3) If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

4) If you want a specific applet/software/theme/etc that is budgie-desktop related feel free to make a request, I will see what I can do to get it added to the overlay.

5) If there is an applet/software/theme you want let me know with a link and I will see if I can add it in the overlay for you.

6) I will keep appstream updated in sync with the main line gentoo tree. This usually happens within a few days at most from any mainline update.

7) Changes are now recorded in the CHANGELOG.md file, read that for any changes made.

8) ToDo's are now recorded in the TODO.md file, read that for any potential future changes/focus.
