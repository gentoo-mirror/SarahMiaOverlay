# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Budgie Desktop default backgrounds"
HOMEPAGE="https://github.com/BuddiesOfBudgie/${PN}"

SRC_URI="https://github.com/BuddiesOfBudgie/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 x86 ~arm ~arm64"

DEPEND="
	>=gnome-extra/budgie-desktop-10.8
	media-gfx/jhead
	media-gfx/imagemagick[jpeg]
	"
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
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update

	elog "If you have updated this from v2.0 then the backgrounds that are installed have changed. Please double check your settings in the Wallpaper settings tab of Budgie Control Center."
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
