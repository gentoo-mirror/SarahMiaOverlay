# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="AppIndicator applet for budgie-desktop."
HOMEPAGE="https://github.com/UbuntuBudgie/${PN}"
SRC_URI="https://github.com/UbuntuBudgie/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

DEPEND="
	>=budgie-base/budgie-desktop-10
	dev-libs/libayatana-appindicator
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/fixes.patch"
)

src_prepare() {
	default
	eautoreconf
}

pkg_postinst() {
	elog "In order for the applet to appear after installation without relogging it is recommended to run the following  as your current logged in user:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}

pkg_postrm() {
	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}
