# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Basic desktop icons/managemlent for Budgie Desktop."
HOMEPAGE="https://github.com/BuddiesOfBudgie/${PN}"

SRC_URI="https://github.com/BuddiesOfBudgie/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="stateless"

DEPEND=">=gnome-extra/budgie-desktop-10.6"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	$(vala_depend)
"

src_unpack() {
	unpack ${P}.tar.gz
}

src_prepare() {
	vala_src_prepare
	default
}

src_configure() {
	local emesonargs=(
		$(meson_use stateless with-stateless)
	)

	meson_src_configure
}

src_compile() {
	meson_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
