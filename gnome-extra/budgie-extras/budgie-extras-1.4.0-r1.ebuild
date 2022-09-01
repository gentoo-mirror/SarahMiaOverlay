# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Additional enhancements for the user experience. Contains many applets. Made for Budgie Desktop."
HOMEPAGE="https://github.com/UbuntuBudgie/${PN}"

NETWORK_COMMIT="8cb25b3"
APPLICATIONS_MENU_COMMIT="8bbf6c0"
QUICKCHAR_COMMIT="54fddb9"
TRASH_COMMIT="8132ec7"

SRC_URI="https://github.com/UbuntuBudgie/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/UbuntuBudgie/applications-menu/archive/${APPLICATIONS_MENU_COMMIT}.tar.gz -> budgie-applications-menu-applet-${APPLICATIONS_MENU_COMMIT}.tar.gz
	https://github.com/UbuntuBudgie/budgie-network-applet/archive/${NETWORK_COMMIT}.tar.gz -> budgie-network-applet-${NETWORK_COMMIT}.tar.gz
	https://github.com/UbuntuBudgie/QuickChar/archive/${QUICKCHAR_COMMIT}.tar.gz -> budgie-quickchar-applet-${QUICKCHAR_COMMIT}.tar.gz
	https://github.com/UbuntuBudgie/budgie-trash-applet/archive/${TRASH_COMMIT}.tar.gz -> budgie-trash-applet-${TRASH_COMMIT}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~arm ~arm64"

DEPEND="
	>=gnome-extra/budgie-desktop-10.6
	dev-libs/libgee
	>=net-libs/libsoup-2.4
	dev-libs/granite
	dev-libs/appstream[vala]
	dev-libs/keybinder
	gui-libs/libhandy:1[vala]
	"
RDEPEND="
	${DEPEND}
	x11-apps/xinput
	"
BDEPEND="
	dev-util/meson
	$(vala_depend)
"

src_unpack() {
	unpack ${P}.tar.gz
	pushd ${S}/budgie-applications-menu || die
		unpack budgie-applications-menu-applet-${APPLICATIONS_MENU_COMMIT}.tar.gz
		mv -fT applications-menu-* applications-menu || die
	popd || die
	pushd ${S}/budgie-network-manager || die
		unpack budgie-network-applet-${NETWORK_COMMIT}.tar.gz
		mv -fT budgie-network-applet-* budgie-network-applet || die
	popd || die
	pushd ${S}/budgie-quickchar || die
		unpack budgie-quickchar-applet-${QUICKCHAR_COMMIT}.tar.gz
		mv -fT QuickChar-* quickchar || die
	popd || die
	pushd ${S}/budgie-trash || die
		unpack budgie-trash-applet-${TRASH_COMMIT}.tar.gz
		mv -fT budgie-trash-applet-* trash || die
	popd || die
}

src_prepare() {
	vala_src_prepare
	default
}

src_configure() {
	local emesonargs=(
		-Dwith-zeitgeist=false
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update

	elog "In order for all the applets to appear after installation without relogging it is recommended to run the following  as your current logged in user:"
	elog "  budgie-panel --replace &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for all the applets to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  budgie-panel --replace &"
}
