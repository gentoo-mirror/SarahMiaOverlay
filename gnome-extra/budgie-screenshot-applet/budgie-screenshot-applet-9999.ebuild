# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.48"

inherit git-r3 meson vala gnome2-utils xdg

DESCRIPTION="Take a screenshot of your desktop, a window or region; save to disk and upload. Made for Budgie Desktop."
HOMEPAGE="https://github.com/cybre/${PN}"

EGIT_REPO_URI="https://github.com/cybre/${PN}.git"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND="
	>=gnome-extra/budgie-desktop-1.0
	>=gnome-base/gnome-desktop-3.0
	>=dev-libs/json-glib-1.0
	>=x11-libs/gtk+-3.0
	>=net-libs/libsoup-2.4
	dev-lang/vala
	"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson $(vala_depend)"

src_prepare() {
	vala_src_prepare
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

	elog "In order for the applet to appear after installation without relogging it is recommended to run the following  as your current logged in user:"
	elog "	budgie-panel --replace &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "	budgie-panel --replace &"
}
