# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="indicator-sysmonitor"

DESCRIPTION="AppIndicator applet for budgie-desktop."
HOMEPAGE="https://github.com/fossfreedom/${MY_PN}"
SRC_URI="https://github.com/fossfreedom/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

DEPEND="
	>=gnome-extra/budgie-desktop-10
	dev-libs/libayatana-appindicator
"
RDEPEND="
	${DEPEND}
	dev-python/psutil
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/directory_fix.patch"
)

src_unpack() {
	unpack ${P}.tar.gz
	mv ${WORKDIR}/${MY_PN}-${PV} ${WORKDIR}/${P}
}

src_configure() {
	true
}

src_compile() {
	true
}

src_install() {
	#went with patch approach incase upstream changes stuff
	#sed -e "/BUDGIELIB/ s|=lib/|=$(get_libdir)/|" -i Makefile
	emake DESTDIR="${D}" BUDGIELIB="$(get_libdir)/budgie-desktop/plugins/budgiesysmonitor" installbudgie
}

pkg_postinst() {
	elog "In order for the applet to appear after installation without relogging it is recommended to run the following  as your current logged in user:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}

pkg_postrm() {
	elog "In order for the applet to be removed from the budgie-settings applets without relogging it is recommended to run the following as your current logged in user in budgie:"
	elog "  nohup budgie-panel --replace > /dev/null 2>&1 &"
}
