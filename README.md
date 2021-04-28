# SarahMiaOverlay

**Budgie**

This overlay contains both the budgie-desktop and applets for said desktop.

**Other**

This overlay contains other packages that either fixes or adds unlisted versions

## Installation

to add run

> eselect repository add SarahMiaOverlay git https://gitlab.com/SarahMia/sarahmiaoverlay

## Notes:

If anything comes up feel free to contact me by making an issue. I will handle 

In addition the idea-community ebuild was added due to the gentoo mainline 2021.3.1 version actually installs 2020.3.1 version. This may cause it to look like a downgrade when installing 2021.1 version. Please note that you can prevent that by having the following line in your package.use file:

*/etc/portage/package.accept_keyword*
> # Only installs idea 2021.1 version without making the mainline gentoo idea-community ebuild look like an upgrade
> =dev-util/idea-community-2021.1.211.6993.111
