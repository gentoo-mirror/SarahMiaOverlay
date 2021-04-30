# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GNOME_MIN_VERSIOM="3.36.0"

inherit git-r3 autotools gnome2-utils

DESCRIPTION="Budgie Screensaver is a fork of gnome-screensaver intended for use with Budgie Desktop and is similar in purpose to other screensavers such as MATE Screensaver."
HOMEPAGE="https://github.com/getsolus/${PN}"
EGIT_REPO_URI="https://github.com/getsolus/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	>=dev-libs/glib-2.64.0:=
	>=gnome-base/gnome-desktop-${GNOME_MIN_VERSIOM}:3
	>=gnome-base/gsettings-desktop-schemas-${GNOME_MIN_VERSIOM}
	>=x11-libs/gtk+-3.1.91:3[X]
	x11-libs/libX11:=
	x11-libs/libXcomposite:=
	dev-libs/dbus-glib
	gnome-base/gnome-common
	sys-libs/pam
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=(
		--with-pam-prefix=/etc
	)

	econf "${myconf[@]}"
}

src_install() {
	default
	fperms u+s /usr/libexec/budgie-screensaver-dialog
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
