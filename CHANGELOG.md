# Changelog

I will keep all updates here listed and up to date;

## 2023/8/21 - 10.7.2 Stable

In preparation for 1.8 and other updates and releases 10.7.2 is made stable. 10.8 will take a bit of time as some major changes were made (no longer using mutter e.g.)

### Changed
- budgie-desktop-10.7.2 - now stable
- budgie-meta-10.7.2 - now stable

### Removed
- budgie-desktop-10.7.1 - outdated
- budgie-meta-10.7.1 - oudated

## 2023/6/25 - Dependency fixes

### Fixed
- budgie-screensaver - added the missing dependency gnome-base/libgnomekbd-3
- budgie-extras - fixed the version requirement of net-libs/libsoup to the new 2.4 slot
- budgie-haste-applet - fixed the version requirement of net-libs/libsoup to the new 2.4 slot
- budgie-screenshot-applet - fixed the version requirement of net-libs/libsoup to the new 2.4 slot

## 2023/5/19 - Budgie 10.7.2 and Stabilizations

### Added
- budgie-meta-10.7.2 - new meta release
- budgie-desktop-10.7.2 - new release

### Changed
- budgie-meta-10.7.1 - now stable
- budgie-desktop-10.7.1 - now stable
- budgie-extras-1.6.0 - now stable
- budgie-extras-9999 - now makes use of new useflags
- budgie-analogue-clock-applet-2.0 - now stable
- README.md - minor content fix

### Removed
- budgie-meta-10.7 - outdated
- budgie-desktop-10.7 - outdated
- budgie-analogue-clock-applet-1.3.0 - outdated
- budgie-extras-1.5.0 - outdated

## 2023/4/8 - Budgie 10.7.1 and Budgie-Extras 1.6.0 with separate applets feature!

### Added
- budgie-meta-10.7.1 - new meta release
- budgie-desktop-10.7.1 - new release
- budgie-extras-1.6.0 - new release
- budgie-analogue-clock-applet-2.0 - new release
- budgie-extras-1.6.0:BUDGIE_EXTRAS_APPLETS - new feature that allows you to pick and choose the applets you want without having install everything. See README.md for more details

### Changed
- budgie-meta-10.7 - now stable
- budgie-desktop-10.7 - now stable
- budgie-control-center-1.2.0 - now stable
- budgie-desktop-view-1.2.1 - now stable
- budgie-backgrounds-1.0 - now stable
- budgie-screensaver-5.1.0 - now stable
- README.md - changed/added contents
- TODO.md - changed contents

### Removed
- budgie-meta-10.6.4 - outdated
- budgie-desktop-10.6.4 - outdated
- budgie-control-center - version 1.1.1 outdated and cleaned up the patches in the files/ directory that are no longer relevant
- budgie-desktop-view-1.2 - outdated
- budgie-backgrounds-0.1 - outdated
- budgie-screensaver-5.0.2 - outdated

## 2023/2/8 - Budgie 10.7 has flown in!

### Added
- budgie-meta-10.7 - new meta release
- budgie-desktop-10.7 - new release
- budgie-control-center-1.2.0 - new release
- budgie-desktop-view-1.2.1 - new release
- budgie-screensaver-5.1.0 - new release
- budgie-backgrounds-1.0 - new release
- budgie-analogue-clock-applet-1.3 - new release
- budgie-calendar-applet-5.3 - new update
- appstream-0.15.6 - new release in mainline, now updated with vala support like older versions
- all - packages that had no metadata.xml now have a metadata.xml

### Changed
- All ebuilds that were using using EAPI 7 now use EAPI 8.
- ~arm and ~arm64 useflags added to all ebuilds that didn't have them.
- budgie-desktop-10.6.4 - now stable
- budgie-desktop-view-1.2 - now stable
- budgie-brightness-control-applet-0.3 - now stable
- budgie-meta-10.6.4 - now stable and has the minimal useflag in preparation for the modular 10.7 upgrade.
- budgie-backgrounds-0.1 - now stable
- budgie-control-center-1.1.1 - now stable
- budgie-clipboard-applet-1.1.0 - now stable
- budgie-extras-1.5.0 - now stable
- budgie-haste-applet-0.3.0 - now stable
- budgie-pixel-saver-applet-4.0.0 - now stable
- budgie-screenshot-applet-0.4.3 - now stable
- budgie-systemmonitor-applet-0.2.1 - now stable
- all 9990 ebuilds - checked and made up to date where needed.
- README.md - new contents
- TODO.md - small update on budgie-extras and budgie-control-center. 9999 removed as it is fixed now..

### Fixed
- budgie-control-center - versions 1.1.1 and 1.2.0 now have proper python reliance as well.
- all ebuilds had a thorough cleanup and some minor fixes where needed. No more need for separate downloads of subprojects etc.

### Removed
- hid-asus-rog - no longer needed since it is in the kernel already for a long time.
- appstream - versions 0.14.6 and 0.15.5 due to no longer present in mainline
- budgie-analogue-clock-applet - versions 1.1 and 9999 are outdated
- budgie-brightness-control-applet-0.2.1 - outdated
- budgie-calendar-applet-5.2 - outdated
- budgie-control-center - versions 1.0.2 and 1.1.0 are outdated
- budgie-desktop-view-1.1.1 - outdated
- budgie-desktop - versions 10.5.3-r2 and 10.6.1 are outdated
- budgie-extras - versions 1.3.0-r1, 1.4.0-r1 and 1.4.0.r2 are outdated
- budgie-meta-10.6.1-r1 - outdated
- budgie-screensaver-4.0 - outdated 

## 2022/11/22

### Changed
- budgie-backgrounds - fixed missing dependency

## 2022/09/29

### Added: 
- budgie-backgrounds-0.1 - a new project proving basic backgrounds for the budgie-desktop
- budgie-control-center-1.1.1 - minor update from 1.1.0, libhandy now added as dependency
- appstream-0.15.5 - reflect mainline appstream update with vala added
- CHANGELOG.md - split off the readme changes section into its own file
- x11-misc/xprintidle - another takeover from mainline due to needing this stable, but it is not updated since 2018 as still unstable in mainline o.O
- dev-python/svgwrite - yet another takeover from mainline due to needing this stable, but upstream commpletely inactive and still unstable in mainline o.O
- budgie-extras-1.5.0 - Update, also went through every single dependency on the list for every module separately, there was quite a lot of extra runtime dependencies. I am surprised no one mentioned these to me at all o.O (I knew of 1, but did not expect 14 of em o.O) Now with new useflag networkmanager.
- budgie-meta-10.6.4 - New meta now including the new budgie-backgrounds as well. Meant for unstable keywords only for now
- TODO.md - split off from the readme todo's section into its own file

### Changed
- README.md - changes and todo's were taken out, contents updated.
- budgie-meta-10.6.1-r1 - now allowing unstable new version of budgie-extras-1.5.0
- budgie-extras-1.4.0-r2 - now has networkmanager optional and deps fixed
- budgie-control-center-1.1.0 - now has libhandy as requirement


## 2022/09/01

Big update, several version updates and several stabilizations. Also some old or redundants ebuilds removed. Meta had its components versions locked till new meta is out.


## 2022/06/13

### Added
- budgie-screensaver-5.0.2
- budgie-control-center-1.0.2

### Changed
- readme with latest changes on my todo list.


## 2022/04/09

### Added
- budgie-desktop-10.6.1
- budgie-screensaver-5.0.1
- budgie-meta-10.6.1
- budgie-control-center-1.0.1

### Changed
- Appstream updated with new ~ppc keyword.


## 2022/04/06

### Changed
- budgie-desktop-10.5.3-r2 - made stable
- budgie-desktop-view-1.1.1 - made stable
- Readme updated to clarify some stuff regarding keywords.


## 2022/03/15

### Added
- budgoe-desktop-10.6
- budgie-screensaver-5.0
- budgie-extras-1.4.0
- budgie-desktop-view-1.2

### Removed
- budgie-extras-1.2.0 has been removed.


## 2022/01/17

### Added
- budgie-desktop-10.5.3-r1 - with mutter 9 support for those running unstable gnome41.3+ version. 

### Changed
- Budgie-extras-1.3.0 - made stable

### Removed
- Old version of budgie-desktop


## 2021/12/15

Budgie-extras will be set to stable later mid january if nothing changes. At the same time budgie-desktop version 10.5.2 will be removed as it has become obsolete.

### Changed
- Budgie-desktop and budgie-screensaver been made stable due to not getting any reports. 


## Notes:

**: Unstable/stable refers to keywords in regards to e.g. x86/amd64 vs ~x86/~amd64 !
