# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"

inherit git-r3 meson vala gnome2-utils xdg

DESCRIPTION="Post any text, be it code or prose, to various services directly from your desktop. Made for Budgie Desktop."
HOMEPAGE="https://github.com/cybre/${PN}"

EGIT_REPO_URI="https://github.com/cybre/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	>=gnome-extra/budgie-desktop-10.6.4
	>=dev-libs/json-glib-1.0
	net-libs/libsoup:2.4
"
RDEPEND="${DEPEND}"
BDEPEND="$(vala_depend)"

src_prepare() {
	vala_setup
	default
}

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update

	elog "In order for the applet to appear after installation without relogging it is recommended to run the following as your current logged in user:"
	elog "	budgie-panel --replace &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "	budgie-panel --replace &"
}
