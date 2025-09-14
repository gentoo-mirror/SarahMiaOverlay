# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson gnome2-utils xdg

DESCRIPTION="Budgie Screensaver is a fork of gnome-screensaver intended for use with Budgie Desktop and is similar in purpose to other screensavers such as MATE Screensaver."
HOMEPAGE="https://github.com/BuddiesOfBudgie/budgie-screensaver"

EGIT_REPO_URI="https://github.com/BuddiesOfBudgie/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="systemd +locking +xtools"
GNOME_MIN_VERSIOM="3.36.0"

DEPEND="
	>=dev-libs/glib-2.64.0:=
	>=gnome-base/gnome-desktop-${GNOME_MIN_VERSIOM}:3
	>=gnome-base/gsettings-desktop-schemas-${GNOME_MIN_VERSIOM}
	>=x11-libs/gtk+-3.1.91:3[X]
	dev-libs/dbus-glib
	sys-libs/pam
	systemd? ( >=sys-apps/systemd-209:0= )
	xtools? ( x11-libs/libXxf86vm )
"
RDEPEND="
	${DEPEND}
	>=gnome-base/libgnomekbd-3
"
src_configure() {
	local emesonargs=(
		$(meson_use systemd with-systemd)
		-Dno-locking=$(usex locking false true)
		$(meson_use xtools with-xf86gamma-ext)
		-Dwith-console-kit=false
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
