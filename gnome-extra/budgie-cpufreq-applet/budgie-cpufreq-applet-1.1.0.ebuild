# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="This applet controls the frequency of the processor (Sandy Bridge and newer). Made for Budgie Desktop."
HOMEPAGE="https://github.com/UbuntuBudgie/${PN}"
SRC_URI="https://github.com/UbuntuBudgie/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

DEPEND="
	>=gnome-extra/budgie-desktop-10
	>=sys-auth/polkit-0.105[introspection]
"
#Disabled libpeas:2 for now since wayland is disabled till 10.10 comes out.. could cause trouble otherwise..
#dev-libs/libpeas:2=[vala]

RDEPEND="${DEPEND}"
BDEPEND="$(vala_depend)"

PATCHES=(
	"${FILESDIR}/wayland_optional.patch"
)

src_unpack() {
	unpack ${P}.tar.gz
	cp ${FILESDIR}/meson_options.txt ${WORKDIR}/${P}/
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
