# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION="0.52"
GNOME_MIN_VERSIOM="43"

inherit gnome2-utils meson vala xdg

DESCRIPTION="Desktop Environment based on GNOME 3"
HOMEPAGE="https://github.com/BuddiesOfBudgie/"
SRC_URI="https://github.com/BuddiesOfBudgie/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
IUSE="gtk-doc +policykit stateless +bluetooth +hibernate input_devices_wacom"

COMMON_DEPEND="
	>=app-i18n/ibus-1.5.10[vala]
	>=dev-libs/glib-2.66.3:=
	>=dev-libs/libpeas-1.26.0:0=[gtk]
	>=dev-libs/libgee-0.20.0:0.8=
	>=gnome-base/gnome-desktop-${GNOME_MIN_VERSIOM}:3
	>=gnome-base/gnome-settings-daemon-47.2
	>=gnome-base/gsettings-desktop-schemas-${GNOME_MIN_VERSIOM}
	>=gnome-base/gnome-menus-3.10.3:3[introspection]
	>=budgie-base/budgie-screensaver-5.0
	media-libs/gstreamer:1.0
	media-libs/libcanberra-gtk3:=
	>=media-libs/graphene-1.10:=[introspection]
	>=media-libs/libpulse-2.0[glib]
	bluetooth? ( net-wireless/bluez )
	>=sys-apps/accountsservice-0.6.55
	sys-apps/util-linux
	>=sys-power/upower-1.0:0=
	>=x11-libs/gtk+-3.24.35:3[X,introspection]
	>=x11-libs/libnotify-0.7
	>=x11-libs/libwnck-${GNOME_MIN_VERSIOM}:3
	x11-libs/libX11:=
	x11-libs/libXcomposite:=
	>=x11-libs/cairo-1.5.10
	>=x11-wm/magpie-0.9
	policykit? ( >=sys-auth/polkit-0.105[introspection] )
	>=gnome-extra/zenity-3.44.2
	>=xfce-base/libxfce4windowing-4.19.7
"
# use older version of libxfce4windowing or the build will crash

RDEPEND="
	${COMMON_DEPEND}
	budgie-base/budgie-session
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

PATCHES=(
	"${FILESDIR}/wacom_optional.patch"
)

src_unpack() {
	unpack ${P}.tar.xz
}

src_prepare() {
	sed -i -e "/add_install_script.*meson_post_install\.sh/d" meson.build || die

	vala_setup
	default
}

src_configure() {
	local emesonargs=(
		$(meson_use gtk-doc with-gtk-doc)
		$(meson_use policykit with-polkit)
		$(meson_use stateless with-stateless)
		$(meson_use bluetooth with-bluetooth)
		$(meson_use hibernate with-hibernate)
		$(meson_use input_devices_wacom with-wacom)
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
