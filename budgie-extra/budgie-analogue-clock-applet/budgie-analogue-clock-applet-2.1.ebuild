# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"
MY_PN="analogue-clock-applet"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Add an analogue clock to the Budgie Panel. Made for Budgie Desktop."
HOMEPAGE="https://github.com/samlane-ma/${MY_PN}"

SRC_URI="https://github.com/samlane-ma/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~arm ~arm64"
# disabling this for now since 1.9.2 does not purely run on wayland.. this is a future settings
#IUSE="wayland"

DEPEND=">=budgie-base/budgie-desktop-10.6.4"
RDEPEND="${DEPEND}"
BDEPEND="$(vala_depend)"

src_unpack() {
	unpack ${P}.tar.gz
	mv ${WORKDIR}/${MY_PN}-${PV} ${WORKDIR}/${P}
}

src_prepare() {
	vala_setup
	default
}

src_configure() {
	# disabling this for now since 10.9.2 does not purely run on wayland.. this is a future setting. By default it is false anyway.
	local emesonargs=(
		#$(meson_use wayland for-wayland)
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update

	elog "In order for the applet to appear after installation without relogging it is recommended to run the following as your current logged in user:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}
