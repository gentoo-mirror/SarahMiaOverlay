# SarahMiaOverlay

**Budgie**

This overlay contains both the budgie-desktop, extras and applets for budgie desktop.
budgie-extras add a lot of applets and helper applications.

After merging budgie-extras please start the Window Shuffler. This can be done with the provided Window Shuffler application in your applications list/menu. You can set additional options there as well.

**Other**

This overlay contains other packages that either fixes or adds unlisted versions

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

2) Budgie-extras will not install budgie-applications-menu-applet due to inherit problems. 
    - Zeitgeist for fast learning is disabled by default in the ebuild. (Is part of another overlay with separate settings specific for unity desktop). 
    - The biggest problem is that the needed dependency appstreamer needs vala support which is not in the mainline gentoo.

## Todo:

- Add appstreamer build with vala support
- Re-enable budgie-applications-menu-applet in budgie-extras with appstream[vala] dependency when above is done
- Look into the source of budgie-brightness-control-applet to see why it won't work. Till then the ebuild won't be in the overlay