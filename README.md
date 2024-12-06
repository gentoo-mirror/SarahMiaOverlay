**UPDATE December 7th '24: 10.8.2 is back and working fully stable (yay!!). My apolagies for the very long delay/wait. Work on 10.9.2 will start soon, hoping to have that running in a few weeks unless things go heavily wrong ~ Sarah**

# SarahMiaOverlay

*Despite the name this overlay has, it only supplies ebuilds meant for Budgie Desktop. Due to historic reasons this started out as a personal overlay with adjusted ebuilds with budgie-desktop being among them as well. Over time all those adjusted ebuilds are gone and there is only ebuilds for Budgie Desktop and it's support left now. This overlay will keep on fully supporting Budgie Desktop.*

## Budgie Desktop:

The Budgie Desktop is a feature-rich, modern desktop designed to keep out the way of the user.

This overlay contains both the budgie-desktop, applications and applets and its dependencies for Budgie Desktop. Everything that is needed to run Budgie Desktop is present.

For more information about budgie you can visit https://buddiesofbudgie.org/ and/or https://blog.buddiesofbudgie.org/ and https://github.com/BuddiesOfBudgie/budgie-desktop/blob/main/README.md

## Installation:

### 1) Add the Overlay

To use the overlay you first have to add it to portage. Doing this first requires you to emerge eselect repository and after that you can simply add the overlay with a single command.

	emerge -av eselect-repository # Skip this if you already have eselect-repository installed
	eselect repository enable SarahMiaOverlay
	emerge --sync SarahMiaOverlay

After that is done you can just select the budgie-desktop session from your favorite login manager. Budgie by itself favors lightdm with slick-greeter or gtk-greeter, but is not limited to any.

### 2) Install Budgie Meta Package

The recommended way is installing budgie-meta. This is a meta package that contains the packages that are needed for the basic desktop. If you want only the minimal installation but with support you can set the `minimal` keyword. By default it will install budgie-desktop, budgie-screensaver, budgie-desktop-view, budgie-control-center, budgie-extras (not with minimal set) and budgie-backgrounds (not with minimal set).

#### Basic Installation

Run the follow command to install the desktop itself:

	emerge --ask --verbose budgie-meta

The latest release can be installed directly. When the next update comes around those new versions will be added with ~amd/~x86 keywords. To automatically install those versions you could already unmask those packages. Check below in the F.A.Q section where the command is listed.

#### Adjusting contents of Budgie-Extras package (if not running minimal)

*Skip this section if you are not running the `minimal` useflag of budgie-meta!*

When installing budgie-extras you can now specify which applets you want to install from that package. When doing this you can see all applets through the following command:

	emerge --pretend --verbose budgie-extras
	
You will see BUDGIE_EXTRAS_APPLETS="..." appearing, this means those applets will be installed. By default it will install all of them. To specify which ones you want you can add the following in your /etc/portage/make.conf file:

	BUDGIE_EXTRAS_APPLETS="whichever-applets-you-want-here separated-by-spaces"
	
This will tell the package which applets to install. At least one applet (or the `all` optionm, *not to be confused with the `all-packages` option from budgie-meta!*) must be selected. To see what each applet is you can run the following command(s):

	emerge --ask --verbose gentoolkit # Skip this if already installed
	equery u budgie-extras
	
You will need to remerge budgie-extras for this! Please run the following command:

	emerge -1av budgie-extras
	
*Note: The Trash applet and networkmanager applets inside budgie-extras are not included in the `all` options. For network manager please enable the `networkmanager` useflag. For the Trash applet please add `trash` inside your BUDGIE_EXTRAS_APPLETS=".." in your make.conf. Trash applet by itself is also included in budgie-desktop since 10.8!

#### Other Applets

While budgie-extras does contain a lot of applets, it is not all. There are some applets made by other people are not part of extras. You can either install these separately or have them all installed with the useflag `all-packages` from budgie-meta. Do not confuse this with the `all` option from budgie-extras please. These are named in the form of 'budgie-xyz-applet'. You can search through by searching for budgie packages. The following command will do that:

	emerge -s budgie #no wildcard possible sadly
	
All applets follow the naming of budgie-xyz-applet so you can simply look through the list of packages. It should not be that many. From there on your can install them as you see fit.

### 3) Tips to personalize Budgie Destop with extra applets and applications

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

### 1) Does it have tiling?

Yes it does have tiling. For that you need to install budgie-extras. By default this is included in budgie-meta. Make sure you are not running the `minimal` useflag or you have to merge it separately. Also BUDGIE_EXTRAS_APPLETS must either be `all` or contain `window-shuffler`.

### 2) I receive a message saying that gnome-bluetooth is masked and it won't let me install

You should not get this message but if it does happen, please do the following depending on whether your /etc/portage/package.unmask is directory or a file:

*If etc/portage/package.unmask is a file:*
	
	printf '\n# Needed for budgie-desktop\nnet-wireless/gnome-bluetooth:2' > /etc/portage/package.unmask
	
*If etc/portage/package.unmask is a directory:*

	echo 'net-wireless/gnome-bluetooth:2' > /etc/portage/package.unmask/budgie-desktop-bluetooth
	
If you do not use blue-tooth please disable the `bluetooth` useflag:

	echo 'gnome-extra/budgie-desktop -bluetooth' > /etc/portage/package.use/budgie-desktop-no-bt
	
### 3) I receive a message of missing useflag of vala for app-i18n/ibus vala

Please add the `vala` useflag for app-i18n/ibus to your /etc/portage/package.use. You can run the following command:

	echo 'app-i18n/ibus vala' > /etc/portage/package.use/budgie-desktop-ibus-vala
	
### 4) Unmask packages ahead of time for new versions when they are added with ~amd/~x86 keywards

You can run the following command to automatically install new versions upon their release;

	printf '# Budgie-Destop latest versions
	gnome-extra/budgie-meta
	gnome-extra/budgie-control-center
	gnome-extra/budgie-desktop-view
	gnome-extra/budgie-desktop
	gnome-extra/budgie-screensaver
	x11-wm/magpie
	gnome-extra/budgie-extras
	gnome-extra/budgie-backgrounds' > /etc/portage/package.accept_keywords/budgie-desktop-latest
	
Please note that if you run the `minimal` useflag budgie-extras and budgie-backgrounds are not needed. You can adjust the file manually if you want too, but is not needed.

With budgie-meta you can also set the useflag `all-packages` to have everything installed.

## Notes:

1) Latest releases are being added with unstable keywords for a while to allow testing from other users in case something crops up. I will maintain 1 stable and 1 unstable budgie-meta in general unless to much time passes. Which is unlikely with their current release timeframes. Security updates are an exception to this and will be added directly as stable.

2) ~arm and ~arm64 keywords are unlikely to be made stable unless I hear from people that they work good as I am unable to test them myself atm sadly.

3) If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

4) If there is an applet/application/theme you want let me know with a link and I will see if I can add it in the overlay for you. Please do note that for themes any gtk theme should work fine out of the box and can be set through budgie control center.

5) The overlay changes and todo's are each in their own files, refer to CHANGELOG.md or TODO.md for those.

6) The migration installation sections will be removed from this document when I make 10.8 stable. By default I will assume everyone is on 1.7+ then and using budgie-meta.
