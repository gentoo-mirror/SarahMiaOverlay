# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"
PYTHON_COMPAT=( python3_{10..13} )

inherit meson vala gnome2-utils xdg python-any-r1

DESCRIPTION="Highly customizable applet for controlling all of your playing media. Made for Budgie Desktop."
HOMEPAGE="https://github.com/zalesyc/${PN}"
SRC_URI="https://github.com/zalesyc/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

DEPEND=">=budgie-base/budgie-desktop-10"
RDEPEND="
	${DEPEND}
	>=dev-python/pygobject-3.2:3
	dev-python/requests
"
BDEPEND="
	$(vala_depend)
	${PYTHON_DEPS}
"

python_check_deps() {
	python_has_version "dev-python/pygobject[${PYTHON_USEDEP}]" && \
	python_has_version "dev-python/requests[${PYTHON_USEDEP}]"
}

pkg_setup() {
	python-any-r1_pkg_setup
}

src_unpack() {
	unpack ${P}.tar.gz
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

	elog "In order for the applet to appear after installation without relogging it is recommended to run the following  as your current logged in user:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update

	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}
