# SarahMiaOverlay

*Despite the name this overlay has, it only supplies ebuilds meant for Budgie Desktop. Due to historic reasons this started out as a personal overlay with adjusted ebuilds with budgie-desktop being among them as well. Over time all those adjusted ebuilds are gone and there is only ebuilds for Budgie Desktop and it's support left now. This overlay will keep on fully supporting Budgie Desktop.*

**Note: budgie-desktop-10.8 is releaed. Due to changes this new version brings (e.g. no mutter anymore) and some other software along the way this will take a bit of time. In the mean time 10.7.2 was made stable (a bit overdue). I will release 10.8 ebuilds when I am finished with it along with the other updates to other packages.**

**Note 2: mainline gentoo masked gnome-bluetooth:2, if you run into this please unmask 'net-wireless/gnome-bluetooth:2' in your /etc/portage/package.unmask somewhere, see https://gitlab.com/SarahMia/sarahmiaoverlay/-/issues/16 for more information and feel to post there if you need further help, I will keep on trying to find a proper solution in the meantime, when there is it should come with 10.8 as well.**

## Budgie Desktop:

The Budgie Desktop is a feature-rich, modern desktop designed to keep out the way of the user.

This overlay contains both the budgie-desktop, applications and applets and its dependencies for budgie desktop. Everything that is needed to run Budgie Desktop is present.

For more information about budgie you can visit https://blog.buddiesofbudgie.org/ and https://github.com/BuddiesOfBudgie/budgie-desktop/blob/main/README.md

## Installation:

**1) Overlay**

To add the overlay to portage run the following: (assuming you have eselect-repository installed)

	eselect repository enable SarahMiaOverlay

After that is done you can just select the budgie-desktop session from your favorite login manager. Budgie by itself favors lightdm with slick-greeter or gtk-greeter, but is not limited to any.

**2) Budgie Meta Package**

The recommended way is installing budgie-meta. This is a meta package that contains the packages that are needed for the basic desktop. If you want only the minimal installation but with support you can set the `minimal` keyword. By default it will install budgie-desktop, budgie-screensaver, budgie-desktop-view, budgie-control-center, budgie-extras (not with minimal set) and budgie-backgrounds (not with minimal set).

	emerge --ask --verbose budgie-meta
	
When going for latest versions you need to unmask some packages with ~ keywords. With budgie-meta you can then also set the useflag `all-packages` to have everything installed.

**NEW!**: When installing budgie-extras you can now specify which applets you want to install from that package. When doing this you can see all applets through the following command:

	emerge --pretend --verbose budgie-extras
	
You will see BUDGIE_EXTRAS_APPLETS="..." appearing, this means those applets will be installed. By default it will install all of them. To specify which ones you want you can add the following in your /etc/portage/make.conf file:

	BUDGIE_EXTRAS_APPLETS="whichever-applets-you-want-here separated-by-spaces"
	
This will tell the package which applets to install. At least one applet (or the 'all' option) must be selected. To see what each applet is you can run the following command(s).

	emerge --ask --verbose gentoolkit #skip this if already installed
	equery u budgie-extras

**2 Alternative) Budgie Desktop Base (not recommended anymore)**

To install budgie desktop by itself and not use any other software you don't need to do anything special other than the command below (basic emerge command).

For 10.7 and up this is not recommended as any issues you may experience you may not get any support upstream as they expect you to at least run a number of packages. This is reflected in `budgie-meta[minimal]` package with the `minimal` keyword. *(See https://blog.buddiesofbudgie.org/budgie-10-7-released/ for more info)*

	emerge --ask --verbose budgie-desktop
	
**2.5) Migrate to budgie-meta (if not already using budgie-meta)**

If Budgie Desktop was installed through budgie-desktop ebuild then going forward it is recommended to merge budgie-meta. Please follow the following commands. First remove the packages from the world file incase in the future you want to remove budgie-desktop and this will keep the world file clean.

	emerge --deselect budgie-desktop budgie-desktop-view budgie-control-center budgie-screensaver

Ignore any `>>> No matching atoms found in "world" favorites file...` you receive. It means you most likely did not had it installed in the first place and can be safely ignored.
If you are not going to run with budgie-meta with the minimal useflag then you can also perform the following command.

	emerge --deselect budgie-extras budgie-backgrounds
	
Once that is done you can simply emerge budgie-meta. Don't forget to add the minimal useflag if you want to run a minimal installation of budgie-desktop.

	emerge --ask --verbose budgie-meta
	
If you want the very latest versions you will need to unmask budgie-meta, budgie-desktop, budgie-desktop-view and budgie-control-center. If not running with minimal you also need to unmask budgie-backgrounds. And everything else above still applies. Simply run the emerge command to install budgie-meta.

**3) Tips to personalize Budgie Destop with extra applets and applications**

- Merge Budgie Extras (if meta with minimal useflag was installed) and/or any other applets that can be found as budgie-\*-applet in the overlay. (These may be auto installed depending on your useflags if your installed budgie-desktop with budgie-meta, which is recommended anyway, also see above how to customize budgie-extras).
- After merging budgie-extras (or after installing budgie-meta without the minimal useflag) please start the Window Shuffler, some applets will require this (hotcorners mostly). This can be done with the provided Window Shuffler application in your applications list/menu. You can set additional options there as well.
- The usual applications, file manager, image viewer, browser, audio, video players etc.
- Any gtk/gnome application you want to use for a consistant look since budgie-desktop uses gtk
- Change settings in the following applications:
	- Budgie Control Center
	- Budgie Desktop Settings
	- (Part of budgie-extras) Window Shuffler Control (tiling/grid support)
	- (Part of budgie-extras) WallStreet Control (rotating wallpapers)
	- (Part of budgie-extras) Previews Control (display applications preview while alt-tabbing)
	- The config for the new window preview from budgie-extras (for alt-tab) is in the Previews Control in your applications list/menu. You can set additional options there as well.

## Notes:

1) Latest releases are being added with unstable keywords for a while to allow testing from other users in case something crops up. I will maintain 1 stable and 1 unstable budgie-meta in general unless to much time passes. Which is unlikely with their current release timeframes.

2) ~arm and ~arm64 keywords are unlikely to be made stable unless I hear from people that they work good as I am unable to test them myself atm sadly.

3) If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

4) If there is an applet/application/theme you want let me know with a link and I will see if I can add it in the overlay for you. Please do note that for themes any gtk theme should work fine out of the box and can be set through budgie control center.

5) The overlay changes and todo's are each in their own files, refer to CHANGELOG.md or TODO.md for those.
