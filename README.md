# SarahMiaOverlay

**Budgie**

This overlay contains both the budgie-desktop, extras and applets for budgie desktop.
budgie-extras add a lot of applets and helper applications.

After merging budgie-extras please start the Window Shuffler. This can be done with the provided Window Shuffler application in your applications list/menu. You can set additional options there as well.

**Other**

This overlay contains other packages that either fixes or adds unlisted versions/features.

## Installation

to add run

`eselect repository add SarahMiaOverlay git https://gitlab.com/SarahMia/sarahmiaoverlay`

## Notes:

If anything comes up feel free to contact me by making an issue. I will handle it as soon as I can.

1) the idea-community ebuild was added due to the gentoo mainline 2021.3.1 version actually installs 2020.3.1 version. This may cause it to look like a downgrade when installing 2021.1 version. Please note that you can prevent that by having the following line in your package.use file or subfile:

    */etc/portage/package.accept_keyword{/idea-community}*

    ```
	# Only installs idea 2021.1 version without making the mainline gentoo idea-community ebuild look like an upgrade
	=dev-util/idea-community-2021.1.211.6693.111
	```

	If you are unsure of which version you are running please go help/about menu inside the IDE.

## Todo:

- Look into the source of budgie-brightness-control-applet to see why it won't work. Sliders are gone. Ebuild isn't in the public overlay atm. Existing issue does exist however..
- Maybe look into how to lock screen since budgie-screensaver isn't working either somehow.. Ebuild isn't in public overlay atm.
- When above is working fix the placement of the pam file in the proper place in the ebuild.