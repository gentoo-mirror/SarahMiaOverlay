# Changelog

I will keep all updates here listed and up to date;

## 2025/6/10 - New Applet indicators have arrived!

New applets relating to well, any application that makes use of AppIndicator and the other for system information.

### Added
- budgie-indicator-applet - new package
- budgie-indicator-sysmonitor - new package

### Changed
- md5-cache - meta updated

## 2025/6/2 - New Applets, let there be a light(pad)!

New applets added!

### Added
- NEWS.md - new file to keep track of news
- budgie-browser-profile-launcher - new package
- budgie-cpufreq-applet - new package
- budgie-cputemp-applet - new package
- budgie-lightpad-applet - new package
- budgie-media-player-applet - new package
- budgie-performance-gauge-applet - new package
- budgie-user-indicator-redux-applet - new package
- budgie-hostname-applet - new package
- lightpad - new package

### Changed
- md5-cache - meta updated
- README.md - updated

## 2025/3/4 - Intermission..

Nothing major. Removal of appstream and added old version of libxfce4windowing to support budgie-desktop-10.9.2 build. Added latest version of budgie-extras that half support wayland, while awaiting budgie-desktop 10.10 release. Decided to release this standalone without any new changes..

### Added
- libxfce4windowing - old version to support budgie-desktop 10.9.2
- budgie-extras-1.9.0 - new version

### Removed
- appstream - no longer needed as the vala useflag is now supported and old version that was missing it has been removed.

## 2025/2/13 - Gentoo accepted my pull request! No longer need to maintain Appstream

I made a pull request for mainline gentoo to support vala useflag for dev-libs/appstream. This got accepted just a few hours ago. This eliminates a major headache for me where I have to keep track of any changes made to appstream and copy/mirror it with added vala support.

The pull request only accepted it for 1.0.4 and not 1.0.3. Meaning that till 1.0.4 is stable in mainline 1.0.3 will remain on the repository as a stable offering with vala support. After 1.0.4 is stable the entire appstream package will be removed from the overlay.

### Removed
- appstream-1.0.4 - now obsolete due to mainline gentoo accepted my pull request

## 2025/1/19 - In with the new, out with the old! 10.9.2 Stabilization

10.9.2 is now stable, all older version are removed.

### Added
- appstream-1.0.4 - new unstable version, inline with mainstream gentoo repo

### Changed
- budgie-analogue-clock-applet-2.1 - now stable
- budgie-backgrounds-3.0 - now stable
- budgie-contro-center-1.4.0 - now stable
- budgie-desktop-10.9.2 - now stable
- budgie-extras-1.8.0-r1 - now stable
- budgie-meta-10.9.2 - now stable
- budgie-session-0.9.1 - now stable
- magpie-0.9.4 - now stable
- md5-cache - meta updated
- README.md - minor updates
- TODO.md - wiki mention removed, lowered prio on adding gtk theme default, new notion on renaming base package directory.

### Removed
- budgie-analogue-clock-applet-2.0 - outdated
- budgie-backgrounds-2.0 - oudated
- budgie-control-center-1.3.0 - oudated
- budgie-desktop-10.8.2 - oudated
- budgie-extras-1.7.0 - oudated
- budgie-desktop-view - old patch files removed
- budgie-meta-1.8.2 - oudated
- magpie-0.9.3 - outdated

## 2025/1/4

Nothing major. Revision upate for budgie-extras due to tightning of the use flags. All must be disabled if installing specific applets to still prevent all from being installed. Exceptions being network-manager applet which is now fully a separate useflag, trash has also been taken out for clarity and is disabled by default. As well patch file has now proper location.

TBH I am not entirely happy how the useflags go for this particular package go but I will leave it for now, when budgie-meta-11.X comes around in future I may change all of this..

### Added
- budgie-extras-1.8.0-r1 - new revision ebuild, will now install network applet if networkmanager useflag is set, rather than having 2 useless useflags that don't work well together. Trash is a new useflag for the applet. budgie_extras_applets_network_manager and budgie_extras_applets_trash are removed.

### Changed
- budgie-extras - patch no longer in a version directory
- README.md - unstable instructions made future proof, extended/changed budgie-extras instructions

### Fixed
- budgie-extras-9999 - now uses the proper patch file and mimics 1.8.0-r1 in useflags

### Hotfixes from 2025/1/11
- md5-cache updated (I forgot, oopsie..)

## 2024/12/26 - I am feeling a bit blue..

In short, fixing bluetooth dependencies that in the end do not matter.. budgie-desktop now properly has bluez as dependency instead of gnome-bluetooth. Ironically while going over and removing it lo-and-behold, budgie-control-center requires it still.. Ok so I cannot remove that package yet.. But still needed its slotting fixed so prevent pulling in the unneeded gnome-bluetooth-46.x+ from mainline gentoo.. so in the end no revisions needed nor any major changes, at most people will see an extra package removed during `emerge --depclean`.

### Fixed
- budgie-desktop-10.9.2 - now has net-wireless/bluez as dependency instead of net-wireless/bluetooth
- budgie-control-center - now has the proper slot of net-wireless/gnome-bluetooth listed as dependency

## 2024/12/18 - The clock is ticking!

New version of budgie-analogue-clock-applet aimed at the future release of wayland budgie-desktop, for now the useflag wayland is disabled. Didn't realize earlier there was a new version, oopsie.

### Added
- budgie-analogue-clock-applet-2.1 - new release

### Changed
- budgie-meta-10.9.2 - now installs budgie-analogue-clock-applet
- README.md - now has budgie-analogue-clock-applet added to ~release printf command, as well F.A.Q expanded regarding icons and cursors.
- TODO.md - one done, wiki has been updated.

## 2024/12/16

Small dependency fixes for libcanberra which now has their gtk3 counterpart split due to gentoo mainline changes and release of new version of libcanberra-0.30-R8 and libcanberra-gtk3.

### Fixed
- budgie-desktop - now depends on libcanberra-gtk3 instead of libcanberra
- gnome-bluetooth - now depends on libcanberra-gtk3 instead of libcanberra

## 2024/12/14 - Updated budgie-panel command

The commmand listed in the various elog would still close all panels upon closing the terminal. Only with the following command could i prevent budgie-panel being killed from closing the terminal in which the command was run:
	nohup budgie-panel --replace > /dev/null 2>&1 &

### Changed
- budgie-\*-applet/extras - Now has a new command in the log to reload all panels
- README.md - new command listed in F.A.Q. section and small cleanup/minor changes
- TODO.md - updated with small thought about potential splitting off the F.A.Q from the readme
- md5-cache - meta updated

## 2024/12/9 - Updated copyright statements

Pretty much corrected copyright years on all ebuilds to be to 2024, will see what I do next year when I do another pass on the ebuilds. All copyright remained as Gentoo Authors rather than my name as per gentoo copyright policy.

## 2024/12/8 - Budgie session script fixes

Small fixes at budgie-session with now having their scripts fully checked and corrected for as much as possible so all the paths are fully set as they should be.

### Changed
- README.md - small correction and questions regarding theming adjusted/added
- md5-cache - meta updated

### Fixed
- budgie-session - Will now have the correct script variables set and run, naming adjusted as to avoid confusion (no revision because of time of writing ebuild is not in master and thus not public. If already installed from branch then please remerge)

## 2024/12/7 - I am sorry but 10.9.2 is currently in session

Budgie Desktop update 10.9.2 is here. All new ebuilds added as unstable/testing (~). Meaning you to unmask them (add to package.accept_keywords) if you wan to use them.
Also new package budgie-session is here to replace somewhat gnome-session (indirectly still a dependency through gnome-settings-daemon)

### Added
- budgie-meta-10.9.2 - new release
- budgie-desktop-10.9.2 - new release
- budgie-session-0.9.1 - new package
- budgie-backgrounds-3.0 - new release
- budgie-extras-1.8.0 - new release
- budgie-control-center-1.4.0 - new release
- magpie-0.9.4 - new release

### Changed
- README.md - Updated to reflect the new ~ releases of 10.9.2 with other sections also updated
- TODO.md - new todo about gtk theme added
- md5-cache - metadata updated

## 2024/12/6 - A stalking Python eyeing a muttering Magpie!

So it took a long while and ebuilds were broken in the mean time. This update is focused on fixing what needs fixing and improving where needed. During this mess I also found out while magpie is required it still uses some files from Mutter. To make sure these 2 packages can coexist at the same time mutter is now a dependency of Magpie. Otherwise you will have a broken window manager. Beyond that a patch was needed for Budgie-Desktop to make sure it can build fine with GCC14+. Due to this both Budgie-Desktop and Magpie received a revision update. Older versions still present (per gentoo ebuild revision guidelines) but remain broken. This will force the required update. Last big thing is basically Python version updates and streamlining Appstream. Owh and a useflag from a dependency was removed.

### Added
- budgie-desktop-10.8.2-r1 - To force proper build with the patch
- magpie-0.9.3-r1 - Mutter added as dependency
- appstream-1.0.3 - New version taken from mainline gentoo with vala support added

### Changed
- README.md - Previous updates removed and notice about 10.9.2 added
- md5-cache - metadata updated

### Fixed
- svgwrite - Python versions corrected
- budgie-control-center - Python versions corrected
- gnome-bluetooth - Python versions corrected
- budgie-extras - Python versions corrected
- magpie - gles2 useflag removed from mesa dependency as it is not present anymore.

## 2024/1/17 - Meson adjustments + minor fixes

Basically since meson was moved in mainline gentoo and me founding out it is not even needed to list it all entries are removed. This will also fix issue #18.

### Added
- md5-cache metadata added

### Fixed
- budgie-* - all budgie ebuilds have all their build dependency of dev-util/meson removed (which is also now dev-build/meson in mainline gentoo).
- budgie-extras-applets useflag descriptions - fixed a wrong entry.
- budgie-screensaver-5.1.0 - no longer has an missing license entry.
- (late fix 2024/1/20) appstream - fix vala enabled by default for the new appstream versions

## 2024/1/11 - Appstream streamlined

Appstream updated to match mainline gentoo with added vala support

### Added
- appstream - New versions of 0.16.4 and 1.0.1 added with vala support to mirror gentoo mainline

## 2023/12/20 - HAPPY HOLIDAYS!

A small update. basically 10.8.2 is now stable. Which means there are no unstable release at this point in time. My gift to you all. All the latest updates stable. There hasn't been a new release for a while yet anyway so it is perfect timing if you ask me. 

There is however a small update for budgie-extras due to security reasons. Hence why this latest version was made stable from the get-go.

### Added
- budgie-extras-1.7.1 - new release, security update only, also added as stable

### Changed
- budgie-meta-10.8.2 - now stable
- budgie-desktop-10.8.2 - now stable
- budgie-desktop-view-1.3 - now stable

### Removed
- budgie-meta-10.8 - outdated
- budgie-desktop-10.8 - outdated
- budgie-desktop-view-1.2.1 - outdated

## 2023/10/22 - 10.8.2 minor update

A new day, a new release, nothing much just minor updates really.

### Added
- budgie-meta-10.8.2 - new release
- budgie-desktop-10.8.2 - new release
- budgie-desktop-view-1.3 - new release

### Changed
- budgie-control-center-1.3.0 - now stable
- budgie-backgrounds-2.0 - now stable
- budgie-extras-1.7.0 - now stable
- magpie-0.9.3 - now stable
- budgie-meta-1.8 - now stable
- budgie-desktop-10.8 - now stable
- README.md - imigrating to budgie-meta is now removed, everyone should be using budgie-meta by now.

### Removed
- budgie-desktop-10.7.2 - outdated
- budgie-control-center-1.2.0 - outdated
- budgie-backgrounds-1.0 - outdated
- budgie-extras-1.6.0 - oudated
- budgie-meta-1.7.2 - outdated

## 2023/9/23 - Roundup fixes

The fix was actually working. Documentation has been adjusted. As well some other minor things that was found after some testing.

### Changed
- README.md - Heavily revised contents, many changes and additions
- CHANGELOG.md - Edited previous entry
- budgie-desktop - no longer has clutter and cogl as dependencies, bluetooth dep no longer included if bluetooth useflag is disabled
- appstream - vala made mandatory enabled
- budgie-extras-9999 - fixed trash and all applet build options and restrictions

### Hotfixes from 2023/9/22
- gnome-bluetooth - fixed missing patch and wrong manifest file
- magpie - added missing metadata.xml file

## 2023/9/22 - 10.8 Has Arrived! Now excuse me while I try to fix my bluetooth >.>

10.8 Is released and live. All new ebuilds are added as unstable as usual.

On an interesting note; Budgie-desktop has forked Mutter 43 and named it Magpie. Like the Raven component of Budgie-Desktop and Budgie itself this is another name of a bird. I really like it that they keep going with the bird names :) The meanings of each bird;

- Budgie is a small, long-tailed, seed-eating parrot. As a Spirit Animal it teaches lessons of simple beauty and resources you sometimes overlook. Quite fittig for what they aim budgie desktop to be.
- Raven is a well, a common raven. But it symbolizes ancient wisdom, intelligence and transformation. And Raven is their notification system.
- Magpie is an eastern bird that symbolized good luck and fortune. Its a common bird in chinese paintings. The Romans, for example, believed that the magpie was highly intelligent with excellent reasoning abilities. Magpie is the system behind all the windows, everything you see is driven by Magpie.

### Added
- budgie-meta-10.8 - new release
- budgie-desktop-10.8 - new release
- magpie-0.9.3 - new package
- budgie-control-center-1.3.0 - new release
- budgie-backgrounds-2.0 - new release
- budgie-extas-1.7.0 - new release
- gnome-bluetooth-3-34-5 - copied from mainline prior to removal on October 1st

### Changed
- svgwrite-1.4.3 - Now in line with mainline gentoo changes
- README.md - changed/added/removed contents
- TODO.md - removed some content (unlikely category)

## 2023/8/21 - 10.7.2 Stable

In preparation for 10.8 and other updates and releases 10.7.2 is made stable. 10.8 will take a bit of time as some major changes were made (no longer using mutter e.g.)

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

### Added
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
