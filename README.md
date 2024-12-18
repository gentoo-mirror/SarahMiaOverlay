**UPDATE December 6th '24: 10.8.2 is back and working fully stable (yay!!). My apolagies for the very long delay/wait.**

**UPDATE Secember 14th '24: Budgie-Desktop 10.9.2 ebuilds are now live out of private testing for portage and trackers after final adjustments, enjoy!**

# SarahMiaOverlay

*Despite the name this overlay has, it only supplies ebuilds meant for Budgie Desktop. Due to historic reasons this started out as a personal overlay with adjusted ebuilds with budgie-desktop being among them as well. Over time all those adjusted ebuilds are gone and there is only ebuilds for Budgie Desktop and it's support left now. This overlay will keep on fully supporting Budgie Desktop.*

## Budgie Desktop:

The Budgie Desktop is a feature-rich, modern desktop designed to keep out of the way of the user.

This overlay contains both the budgie-desktop, applications and applets and its dependencies for Budgie Desktop. Everything that is needed to run Budgie Desktop is present.

For more information about budgie you can visit https://buddiesofbudgie.org/, https://blog.buddiesofbudgie.org/ and/or https://github.com/BuddiesOfBudgie/budgie-desktop/blob/main/README.md

## Installation:

### 1) Add the Overlay

To use the overlay you first have to add it to portage. Doing this first requires you to emerge eselect repository and after that you can simply add the overlay with a single command.

	emerge -av eselect-repository # Skip this if you already have eselect-repository installed
	eselect repository enable SarahMiaOverlay
	emerge --sync SarahMiaOverlay

After that is done you can just select the budgie-desktop session from your favorite login manager. Budgie by itself favors lightdm with slick-greeter or gtk-greeter, but is not limited to any.

### 2) Install Budgie Meta Package

The recommended way is installing budgie-meta. This is a meta package that contains the packages that are needed for the basic desktop. If you want only the minimal installation but with support you can set the `minimal` keyword. By default it will install budgie-desktop, budgie-screensaver, budgie-desktop-view, budgie-control-center, budgie-extras (not with minimal set) and budgie-backgrounds (also not with minimal set).

#### Basic Installation

Run the follow command to install the stable desktop itself (not the latest/(un)stable version! read below for that):

	emerge --ask --verbose budgie-meta

The latest release can be installed with ~amd64/~x86 keywords. To automatically install those versions you should read below in the F.A.Q section where the command is listed. After that just run the same command as above.

#### Adjusting contents of Budgie-Extras package (if not running minimal)

*Skip this section if you are running the `minimal` useflag of budgie-meta!*

When installing budgie-extras you can now specify which applets you want to install from that package. When doing this you can see all applets through the following command:

	emerge --pretend --verbose budgie-extras

You will see BUDGIE_EXTRAS_APPLETS="..." appearing, this means those applets will be installed. By default it will install all of them. To specify which ones you want you can add the following in your /etc/portage/make.conf file:

	BUDGIE_EXTRAS_APPLETS="whichever-applets-you-want-here separated-by-spaces"

This will tell the package which applets to install. At least one applet (or the `all` option, *not to be confused with the `all-packages` option from budgie-meta!*) must be selected. To see what each applet is you can run the following command(s):

	emerge --ask --verbose gentoolkit # Skip this if already installed
	equery u budgie-extras

You will need to remerge budgie-extras for this! Please run the following command:

	emerge -1av budgie-extras

*Note: The Trash applet and networkmanager applets inside budgie-extras are not included in the `all` option. For network manager please enable the `networkmanager` useflag. For the Trash applet please add `trash` inside your BUDGIE_EXTRAS_APPLETS=".." in your make.conf. Trash applet by itself is also included in budgie-desktop since 10.8 and therefor not needed here.*

#### Other Applets

While budgie-extras does contain a lot of applets, it is not all. There are some applets made by other people are not part of extras. You can either install these separately or have them all installed with the useflag `all-packages` from budgie-meta. Do not confuse this with the `all` option from budgie-extras please. These are named in the form of 'budgie-xyz-applet'. You can search through by searching for budgie packages. The following command will do that:

	emerge -s budgie

All applets follow the naming of budgie-xyz-applet so you can simply look through the list of packages. It should not be that many. From there on your can install them as you see fit.

### 3) Tips to personalize Budgie Destop with extra applets and applications

- Install a GTK Theme, by default it comes very barren. (arc, vertex etc all work)
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
	
## F.A.Q. / Troubleshoot

### 1) I tried to change the theme and now it is stuck at High Contrast

Please install a GTK theme, pretty much any should work. In mainline there is `x11-themes/arc-theme` and `x11-themes/vertex-theme` as example. Both work and can be used. I may include a default theme later when I feel there is a good one. Otherwise check the question below on how to get themes from other places.

### 2) How do I use themes?

Budgie Desktop uses GTK for their widgets. Therefore you could get GTK (versions 3/4) themes from e.g. www.gnome-look.org.

Once downloaded place them in ~/.local/share/themes/ directory (running any install.sh should not be needed!). Create this directory if it doesn't exist.
For Gnome applications, download (or use the same one) and inside their contents place the contents of libadwaita in ~/.config/gtk-4.0/ (again, create the directory if it doesn't exist). If it does not have a libadwaita directory then copy the contents of gtk-4.0 directory but things can look a bit weird. As most gnome apps use libadwaita to theme. You can also place symbolic links pointing to ~/.config/gtk-4.0 if wanted instead.

Once above is done you can select your theme in Budgie Desktop Settings under the Style category. For Gnome based apps they should pickup the theme automacally assuming ~/.config/gtk-4.0 is properly setup.

### 3) How do I add icons and/or cursor themes?

Like with the other themes mentioned in the point (#2) above, the icons/cursors theme directory can be placed inside ~/.icons (yes cursors as well). If the directory does not exist please create it.

Once that is done you can select your icons and cursor themes in Budgie Desktop Settings under the Style category.

### 4) I receive a message of missing useflag of vala for app-i18n/ibus vala

Please add the `vala` useflag for app-i18n/ibus to your /etc/portage/package.use. You can run the following command:

	echo 'app-i18n/ibus vala' > /etc/portage/package.use/budgie-desktop-ibus-vala

### 5) How to unmask packages for the latest released versions

You can run the following command to automatically install new versions upon their release;

	printf '# Budgie-Destop latest versions
	gnome-extra/budgie-meta
	gnome-extra/budgie-control-center
	gnome-extra/budgie-desktop-view
	gnome-extra/budgie-desktop
	gnome-extra/budgie-screensaver
	x11-wm/magpie
	gnome-extra/budgie-session
	gnome-extra/budgie-extras
	gnome-extra/budgie-backgrounds
	gnome-extra/budgie-analogue-clock-applet' > /etc/portage/package.accept_keywords/budgie-desktop-latest

Please note that if you run the `minimal` useflag budgie-extras and budgie-backgrounds are not needed. You can adjust the file manually if you want too, but is not needed.

With budgie-meta you can also set the useflag `all-packages` to have everything installed.

In addition to this also note that I can't guarantee that everything will work properly. After passage of time has passed where I heard nothing or issues made have been resolved I will push these versions to stable. This will also happen automatically roughly every month after release of these versions to keep the versions rolling.

### 6) How to low new/updated or remove uninstalled applets?

You can run the following command from any terminal and then close it;

	nohup budgie-panel --replace > /dev/null 2>&1 &

### 7) Does it have tiling?

Yes it does have tiling. For that you need to install budgie-extras. By default this is included in budgie-meta. Make sure you are not running the `minimal` useflag or you have to merge it separately. Also BUDGIE_EXTRAS_APPLETS must either be `all` or contain `window-shuffler`.

### 8) I receive a message saying that gnome-bluetooth is masked and it won't let me install

You should not get this message but if it does happen, please do the following depending on whether your /etc/portage/package.unmask is directory or a file:

*If etc/portage/package.unmask is a file:*

	printf '\n# Needed for budgie-desktop\nnet-wireless/gnome-bluetooth:2' > /etc/portage/package.unmask


*If etc/portage/package.unmask is a directory:*

	echo 'net-wireless/gnome-bluetooth:2' > /etc/portage/package.unmask/budgie-desktop-bluetooth	

If you do not use blue-tooth please disable the `bluetooth` useflag:

	echo 'gnome-extra/budgie-desktop -bluetooth' > /etc/portage/package.use/budgie-desktop-no-bt

### 9) Budgie-Desktop acts weird after upgrading from 1.8.2 to 1.9.2

Due to budgie-session being new and replaces gnome-session, a simple relog may not properly do session tracking. A system reboot should clear any and all issues that may be present (not sure if just restarting X/wayland server will work..)

## Notes:

1) Latest releases are being added with unstable keywords for a while to allow testing from other users in case something crops up. I will maintain 1 stable and 1 unstable budgie-meta in general unless to much time passes. Which is unlikely with their current release timeframes. Security updates are an exception to this and will be added directly as stable.

2) ~arm and ~arm64 keywords are unlikely to be made stable unless I hear from people that they work good as I am unable to test them myself atm sadly.

3) If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

4) If there is an applet/application/theme you want let me know with a link and I will see if I can add it in the overlay for you. Please do note that for themes any gtk theme should work fine out of the box and can be set through budgie control center.

5) The overlay changes and todo's are each in their own files, refer to CHANGELOG.md or TODO.md for those.
