# News

All of the news in regards to changes will be posted here. Difference from Changelog is that this will contain compressed news and somewhat expanded explenations when needed. Will also list news outside of direct changes from changed packages/versions. (What was previously done with 'NOTE:..' in the README).

## 2025/7/18 Clickydy Click Music!

Compile fix and media-player-applet got a version bump.

budgie-media-player-applet: This applet got a version bump. Biggest features are that now you can control mouse click actions on what to do with the applet. (open popup, play/pause, forward and backwards respectively). As well wayland compatible now for future budgie-desktop release.

budgie-desktop: So late august vala 0.56.18 was made stable, this version actually contained an API change that broke compilation. So yeah lovely. This caused it unable to be compiled. Patch added with the fix to allow compilation again.

Regarding budgie desktop 10.10 release, still no news. I am keeping an eye on it but no idea when it will be released.

## 2025/6/10 Indicators arrived!

2 New applets are added. Unless I see more are used elsewhere this should it for a long while.

The added applets are:
- budgie-indicator-applet
- budgie-indicator-sysmonitor-applet

Budgie-indicator-applet is used to have applications place an icon with any indicator for quick actions (similar in a way to a system tray) and the budgie-indicator-sysmonitor-applet is used to monitor system information such a temperatures/load etc.

*Note: While budgie-indicator-applet is appearing for me I was unable to actually see any app in there. Basically missing the apps and accounts for proper testing. If you see it not working properly please do let me know.*

## 2025/6/2 New applets added, semi preparation for 10.10 eventual release

8 New applets were added to the repository. For now all them are made to work with mainly with Budgie-Desktop 10.9.2. They are not added to the meta ebuild to preserve those changes for when 10.10 releases and i split everything up in 2 meta ebuilds.

Some of them have patches to work with both 10.10 and 10.9.2 but having their wayland useflags disabled. This will be changed later when 10.10 releases (I have no idea when this will happen).

The added applets are:
- budgie-browser-profile-launcher
- budgie-cpufreq-applet
- budgie-cputemp-applet
- budgie-lightpad-applet (which launches lightpad)
- budgie-media-player-applet
- budgie-performance-gauge-applet
- budgie-user-indicator-redux-applet
- budgie-hostname-applet

Budgie-Desktop 10.10 status is still unknown. When that releases some small applets may be removed later. See Issues tab for more info.

## >> older news

See Changelog, news is not added retro active here.