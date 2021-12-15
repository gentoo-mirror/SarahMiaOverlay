# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.48"
GNOME_MIN_VERSIOM="3.36.0"

inherit gnome2-utils meson vala xdg

DESCRIPTION="Desktop Environment based on GNOME 3"
HOMEPAGE="https://getsol.us/categories/budgie/"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/solus-project/${PN}.git"
	KEYWORDS=""
else
	# Set these to the submodule commit hashes used in the the upstream version tag matching v${PV}
	# to avoid git dependency
	GVC_COMMIT=c5ab6037
	TRANSLATIONS_COMMIT=8b83aef

	SRC_URI="
		https://github.com/solus-project/${PN}/archive/v${PV}.tar.gz
			-> ${P}.tar.gz
		https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/archive/${GVC_COMMIT}/libgnome-volume-control-${GVC_COMMIT}.tar.gz
		https://github.com/getsolus/budgie-translations/archive/${TRANSLATIONS_COMMIT}.tar.gz
			-> budgie-translations-${TRANSLATIONS_COMMIT}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"

IUSE="gtk-doc +policykit stateless"

COMMON_DEPEND="
	>=app-i18n/ibus-1.5.10[vala]
	>=dev-libs/glib-2.64.0:=
	>=dev-libs/libpeas-1.26.0:0=[gtk]
	>=gnome-base/gnome-desktop-${GNOME_MIN_VERSIOM}:3
	>=gnome-base/gnome-settings-daemon-${GNOME_MIN_VERSIOM}
	>=gnome-base/gsettings-desktop-schemas-${GNOME_MIN_VERSIOM}
	>=gnome-base/gnome-menus-3.10.3:3[introspection]
	>=gnome-extra/budgie-screensaver-4.0
	media-libs/clutter:1.0
	>=media-libs/graphene-1.10:=[introspection]
	media-libs/cogl:1.0
	media-sound/pulseaudio
	>=net-wireless/gnome-bluetooth-3.34.0:=
	>=sys-apps/accountsservice-0.6.55
	sys-apps/util-linux
	>=sys-power/upower-0.99.0:0=
	>=x11-libs/gtk+-3.24.0:3[X]
	>=x11-libs/libnotify-0.7
	>=x11-libs/libwnck-${GNOME_MIN_VERSIOM}:3
	x11-libs/libX11:=
	x11-libs/libXcomposite:=
	x11-wm/mutter:=

	policykit? ( >=sys-auth/polkit-0.105[introspection] )
"

RDEPEND="
	${COMMON_DEPEND}

	>=gnome-base/gnome-control-center-3.26[bluetooth]
	gnome-base/gnome-session
"

BDEPEND="
	$(vala_depend)

	dev-util/intltool
	dev-lang/sassc

	gtk-doc? ( dev-util/gtk-doc )
"

DEPEND="
	${COMMON_DEPEND}

	>=dev-libs/gobject-introspection-1.44.0
"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3-src_unpack
	else
		unpack ${P}.tar.gz
		pushd "${S}"/subprojects || die
			unpack libgnome-volume-control-${GVC_COMMIT}.tar.gz \
				budgie-translations-${TRANSLATIONS_COMMIT}.tar.gz
			mv -fT libgnome-volume-control-* gvc || die
			mv -fT budgie-translations-* translations || die
		popd || die
	fi
}

src_prepare() {
	sed -i -e "/add_install_script.*meson_post_install\.sh/d" \
		meson.build || die

	vala_src_prepare
	default
}

src_configure() {
	local emesonargs=(
		$(meson_use gtk-doc with-gtk-doc)
		$(meson_use policykit with-polkit)
		$(meson_use stateless with-stateless)
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
