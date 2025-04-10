# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"
PYTHON_COMPAT=( python3_{10..13} )

inherit meson vala gnome2-utils xdg python-any-r1

DESCRIPTION="Additional enhancements for the user experience. Contains many applets. Made for Budgie Desktop."
HOMEPAGE="https://github.com/UbuntuBudgie/${PN}"
SRC_URI="https://github.com/UbuntuBudgie/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE_BUDGIE_EXTRAS_APPLETS="
	+budgie_extras_applets_all
	budgie_extras_applets_window-previews
	budgie_extras_applets_workspace-switcher
	budgie_extras_applets_hotcorners
	budgie_extras_applets_quicknote
	budgie_extras_applets_showtime
	budgie_extras_applets_countdown
	budgie_extras_applets_keyboard-autoswitch
	budgie_extras_applets_rotation-lock
	budgie_extras_applets_clockworks
	budgie_extras_applets_dropby
	budgie_extras_applets_kangaroo
	budgie_extras_applets_show-weather
	budgie_extras_applets_trash
	budgie_extras_applets_app-launcher
	budgie_extras_applets_recently-used
	budgie_extras_applets_take-a-break
	budgie_extras_applets_workspace-stopwatch
	budgie_extras_applets_extras-daemon
	budgie_extras_applets_quickchar
	budgie_extras_applets_fuzzyclock
	budgie_extras_applets_brightness-controller
	budgie_extras_applets_visualspace
	budgie_extras_applets_wallstreet
	budgie_extras_applets_applications-menu
	budgie_extras_applets_network-manager
	budgie_extras_applets_window-shuffler
"
IUSE="stateless networkmanager ${IUSE_BUDGIE_EXTRAS_APPLETS}"

# The idea is simple, either 'all' is on, or any of the others, none is not allowed.
# By default the 'all' is on, so most users are not affected by this.
# Kept it in list for to keep it readable.
#
# Also special case for networkmanager and trash applets as they are optional by 
# either default options or systemwide useflags.
REQUIRED_USE="
	|| ( budgie_extras_applets_all
			budgie_extras_applets_window-previews
			budgie_extras_applets_workspace-switcher
			budgie_extras_applets_hotcorners
			budgie_extras_applets_quicknote
			budgie_extras_applets_showtime
			budgie_extras_applets_countdown
			budgie_extras_applets_keyboard-autoswitch
			budgie_extras_applets_rotation-lock
			budgie_extras_applets_clockworks
			budgie_extras_applets_dropby
			budgie_extras_applets_kangaroo
			budgie_extras_applets_show-weather
			budgie_extras_applets_trash
			budgie_extras_applets_app-launcher
			budgie_extras_applets_recently-used
			budgie_extras_applets_take-a-break
			budgie_extras_applets_workspace-stopwatch
			budgie_extras_applets_extras-daemon
			budgie_extras_applets_quickchar
			budgie_extras_applets_fuzzyclock
			budgie_extras_applets_brightness-controller
			budgie_extras_applets_visualspace
			budgie_extras_applets_wallstreet
			budgie_extras_applets_applications-menu
			budgie_extras_applets_network-manager
			budgie_extras_applets_window-shuffler )
	budgie_extras_applets_network-manager? ( networkmanager )
	budgie_extras_applets_window-previews? ( budgie_extras_applets_extras-daemon )
	budgie_extras_applets_quickchar? ( budgie_extras_applets_extras-daemon )
	budgie_extras_applets_window-shuffler? ( budgie_extras_applets_extras-daemon )
	networkmanager? ( || ( budgie_extras_applets_network-manager budgie_extras_applets_all ) )
"

COMMON_DEPEND="
	>=gnome-extra/budgie-desktop-10.7
	dev-libs/appstream[vala]
	dev-libs/granite
	gui-libs/libhandy:1[vala]
	>=dev-libs/json-glib-1.0
	dev-libs/keybinder
	net-libs/libsoup:2.4
"

BDEPEND="${PYTHON_DEPS}"

DEPEND="
	${COMMON_DEPEND}
	budgie_extras_applets_all? ( ${COMMON_DEPEND} )
	networkmanager? (
		>=net-libs/libnma-1.8.0
		>=net-misc/networkmanager-1.24.0:=[modemmanager]
		>=net-misc/modemmanager-0.7 )
"

RDEPEND="
	!budgie_extras_applets_all? (
		budgie_extras_applets_clockworks? (
			media-gfx/cairosvg
			dev-python/svgwrite
			dev-python/pillow
		)

		budgie_extras_applets_countdown? (
			dev-python/psutil
			x11-themes/sound-theme-freedesktop
			media-sound/vorbis-tools
		)

		budgie_extras_applets_dropby? (
			dev-python/psutil
			dev-python/pyudev
			x11-misc/wmctrl
		)

		budgie_extras_applets_kangaroo? (
			x11-misc/xdg-utils
			dev-python/psutil
		)

		budgie_extras_applets_keyboard-autoswitch? (
			dev-python/psutil
			x11-misc/wmctrl
		)

		budgie_extras_applets_window-previews? (
			x11-apps/xinput
			x11-misc/xprintidle
		)

		budgie_extras_applets_quickchar? (
			x11-misc/wmctrl
			dev-python/pyperclip
			dev-python/python-xlib
		)

		budgie_extras_applets_hotcorners? ( x11-misc/xdotool )
		budgie_extras_applets_recently-used? ( x11-misc/xdg-utils )
		budgie_extras_applets_take-a-break? ( x11-misc/xprintidle )
		budgie_extras_applets_show-weather? ( sys-process/procps )
	)

	budgie_extras_applets_all? (
		dev-python/psutil
		dev-python/pyudev
		dev-python/pyperclip
		dev-python/python-xlib
		dev-python/svgwrite
		dev-python/pillow
		media-gfx/cairosvg
		media-sound/vorbis-tools
		sys-process/procps
		x11-apps/xinput
		x11-misc/wmctrl
		x11-misc/xdg-utils
		x11-misc/xdotool
		x11-misc/xprintidle
		x11-themes/sound-theme-freedesktop
	)
"

BDEPEND="$(vala_depend)"

PATCHES=(
	"${FILESDIR}"/exclude-network-applet-build-all.patch
)

python_check_deps() {
	return 0 # need to check if i want to add in test useflag or whether this has any point at all lol and next this section should be removed
	python_has_version "dev-python/python-dbusmock[${PYTHON_USEDEP}]"
}

pkg_setup() {
	python-any-r1_pkg_setup
}

src_unpack() {
	unpack ${P}.tar.xz
}

src_prepare() {
	vala_setup
	default
}

src_configure() {
	local emesonargs=(
		-Dwith-zeitgeist=false
		$(meson_use stateless with-stateless)
		$(meson_use budgie_extras_applets_all with-default-schema)
		$(meson_use budgie_extras_applets_all build-recommended)
		$(meson_use budgie_extras_applets_window-previews build-wpreviews)
		$(meson_use budgie_extras_applets_workspace-switcher build-wswitcher)
		$(meson_use budgie_extras_applets_hotcorners build-hotcorners)
		$(meson_use budgie_extras_applets_quicknote build-quicknote)
		$(meson_use budgie_extras_applets_showtime build-showtime)
		$(meson_use budgie_extras_applets_countdown build-countdown)
		$(meson_use budgie_extras_applets_keyboard-autoswitch build-keyboard-autoswitch)
		$(meson_use budgie_extras_applets_rotation-lock build-rotation-lock)
		$(meson_use budgie_extras_applets_clockworks build-clockworks)
		$(meson_use budgie_extras_applets_dropby build-dropby)
		$(meson_use budgie_extras_applets_kangaroo build-kangaroo)
		$(meson_use budgie_extras_applets_show-weather build-weathershow)
		$(meson_use budgie_extras_applets_app-launcher build-app-launcher)
		$(meson_use budgie_extras_applets_recently-used build-recentlyused)
		$(meson_use budgie_extras_applets_take-a-break build-takeabreak)
		$(meson_use budgie_extras_applets_workspace-stopwatch build-workspacestopwatch)
		$(meson_use budgie_extras_applets_extras-daemon build-extrasdaemon)
		$(meson_use budgie_extras_applets_quickchar build-quickchar)
		$(meson_use budgie_extras_applets_fuzzyclock build-fuzzyclock)
		$(meson_use budgie_extras_applets_brightness-controller build-brightness-controller)
		$(meson_use budgie_extras_applets_visualspace build-visualspace)
		$(meson_use budgie_extras_applets_wallstreet build-wallstreet)
		$(meson_use budgie_extras_applets_applications-menu build-applications-menu)
		$(meson_use budgie_extras_applets_network-manager build-network-manager)
		$(meson_use budgie_extras_applets_window-shuffler build-window-shuffler)
		$(meson_use budgie_extras_applets_trash build-trash)
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update

	elog "In order for all the applets to appear after installation without relogging it is recommended to run the following as your current logged in user:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for all the applets to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}
