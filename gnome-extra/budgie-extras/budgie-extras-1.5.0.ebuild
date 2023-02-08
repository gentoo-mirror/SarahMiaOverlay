# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Additional enhancements for the user experience. Contains many applets. Made for Budgie Desktop."
HOMEPAGE="https://github.com/UbuntuBudgie/${PN}"
SRC_URI="https://github.com/UbuntuBudgie/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~arm ~arm64"
IUSE="stateless networkmanager"

DEPEND="
	>=gnome-extra/budgie-desktop-10.6.4
	dev-libs/libgee
	>=net-libs/libsoup-2.4
	dev-libs/granite
	dev-libs/appstream[vala]
	dev-libs/keybinder
	gui-libs/libhandy:1[vala]
	>=dev-libs/json-glib-1.0
	networkmanager? (
		>=net-libs/libnma-1.8.0
		>=net-misc/networkmanager-1.24.0:=[modemmanager]
		>=net-misc/modemmanager-0.7 )
	"
RDEPEND="
	${DEPEND}
	x11-apps/xinput
	x11-misc/xprintidle
	media-gfx/cairosvg
	dev-python/svgwrite
	dev-python/pillow
	dev-python/psutil
	x11-themes/sound-theme-freedesktop
	media-sound/vorbis-tools
	dev-python/pyudev
	x11-misc/wmctrl
	x11-misc/xdotool
	x11-misc/xdg-utils
	dev-python/pyperclip
	dev-python/python-xlib
	sys-process/procps
	"
BDEPEND="
	dev-util/meson
	$(vala_depend)
"

PATCHES=(
	"${FILESDIR}"/exclude-network-applet-build-all.patch
)

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
		$(meson_use networkmanager build-network-manager)
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
	elog "  budgie-panel --replace &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for all the applets to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  budgie-panel --replace &"
}
