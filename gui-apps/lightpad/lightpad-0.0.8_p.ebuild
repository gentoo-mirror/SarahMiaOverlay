# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"
PYTHON_COMPAT=( python3_{10..13} )
MY_PV="0.0.8"

inherit meson vala gnome2-utils xdg python-any-r1

DESCRIPTION="LightPad is a lightweight, simple and powerful application launcher. (Patched to contain all fixes and config feature)"
HOMEPAGE="https://github.com/libredeb/${PN}"

# would love to take the release download link.. except.. 
# https://github.com/libredeb/${PN}/releases/download/v${MY_PV}/${PN}-${MY_PV}.tar.gz
# according to portage not a gz file? the frick?
SRC_URI="https://github.com/libredeb/${PN}/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

DEPEND="
	>=gnome-extra/budgie-desktop-10.6.4
	x11-terms/xterm
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"
BDEPEND="$(vala_depend)"

PATCHES=(
	"${FILESDIR}/v008-to-f31e0e0.patch"
)

pkg_setup() {
	python-any-r1_pkg_setup
}

src_unpack() {
	unpack ${P}.tar.gz
	mv ${WORKDIR}/${PN}-${MY_PV} ${WORKDIR}/${P}
}

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
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}
