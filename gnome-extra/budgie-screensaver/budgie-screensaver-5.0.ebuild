# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Budgie Screensaver is a fork of gnome-screensaver intended for use with Budgie Desktop and is similar in purpose to other screensavers such as MATE Screensaver."
HOMEPAGE="https://github.com/BuddiesOfBudgie/budgie-screensaver"

SRC_URI="https://github.com/BuddiesOfBudgie/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson $(vala_depend)"

src_unpack() {
	unpack ${P}.tar.gz
}

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
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
