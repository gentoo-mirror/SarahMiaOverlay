# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.53"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Basic desktop icons/managemlent for Budgie Desktop."
HOMEPAGE="https://github.com/BuddiesOfBudgie/${PN}"

SRC_URI="https://github.com/BuddiesOfBudgie/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~arm ~arm64"

IUSE="stateless"

DEPEND=">=gnome-extra/budgie-desktop-10.8.2"
RDEPEND="${DEPEND}"
BDEPEND="$(vala_depend)"

src_unpack() {
	unpack ${P}.tar.xz
}

src_prepare() {
	vala_setup
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
