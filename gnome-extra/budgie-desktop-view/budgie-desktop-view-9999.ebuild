# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.48"

inherit git-r3 meson vala gnome2-utils xdg

DESCRIPTION="Basic desktop icons/managemlent for Budgie Desktop."
HOMEPAGE="https://github.com/BuddiesOfBudgie/${PN}"

EGIT_REPO_URI="https://github.com/BuddiesOfBudgie/${PN}.git"

LICENSE="GPL-3"
SLOT="0"

IUSE="stateless"

DEPEND=">=gnome-extra/budgie-desktop-10.7"
RDEPEND="${DEPEND}"
BDEPEND="$(vala_depend)"

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
