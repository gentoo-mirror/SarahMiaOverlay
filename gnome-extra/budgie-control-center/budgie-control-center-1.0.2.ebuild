# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.48"

inherit meson vala gnome2-utils xdg

DESCRIPTION="Budgie Control Center for Budgie Desktop"
HOMEPAGE="https://github.com/BuddiesOfBudgie/${PN}"

GVC_COMMIT=7a62118
LIBHANDY_COMMIT=7b38a86

SRC_URI="
	https://github.com/BuddiesOfBudgie/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/archive/${GVC_COMMIT}/libgnome-volume-control-${GVC_COMMIT}.tar.gz
	https://gitlab.gnome.org/GNOME/libhandy/-/archive/${LIBHANDY_COMMIT}/libhandy-${LIBHANDY_COMMIT}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="+bluetooth +cups debug elogind +gnome-online-accounts +ibus input_devices_wacom kerberos networkmanager v4l systemd wayland"

DEPEND="
	>=gnome-extra/budgie-desktop-10.6
	gnome-online-accounts? ( >=net-libs/gnome-online-accounts-3.25.3:= )
	>=media-sound/pulseaudio-2.0[glib]
	>=sys-apps/accountsservice-0.6.39
	>=x11-misc/colord-0.1.34:0=
	>=x11-libs/gdk-pixbuf-2.23.0:2
	dev-libs/libxml2:2
	>=dev-libs/libgudev-232
	x11-libs/libX11
	>=x11-libs/libXi-1.2
	media-libs/libepoxy
	app-crypt/gcr:=
	>=dev-libs/libpwquality-1.2.2
	>=sys-auth/polkit-0.105

	cups? (
		>=net-print/cups-1.4[dbus]
		>=net-fs/samba-4.0.0[client]
	)
	ibus? ( >=app-i18n/ibus-1.5.2 )
	networkmanager? (
		>=net-libs/libnma-1.8.0
		>=net-misc/networkmanager-1.24.0:=[modemmanager]
		>=net-misc/modemmanager-0.7 )
	bluetooth? ( >=net-wireless/gnome-bluetooth-3.18.2 )
	input_devices_wacom? ( >=dev-libs/libwacom-0.7 )
	kerberos? ( app-crypt/mit-krb5 )
	v4l? (
		>=media-video/cheese-3.28.0 )

	x11-libs/cairo[glib]
	>=x11-libs/colord-gtk-0.3.0
	media-libs/fontconfig
	gnome-base/libgtop:2=
	>=sys-fs/udisks-2.1.8:2
	app-crypt/libsecret
	net-libs/gnutls:=
	media-libs/gsound
"
RDEPEND="${DEPEND}
	systemd? ( >=sys-apps/systemd-31 )
	elogind? ( app-admin/openrc-settingsd
		sys-auth/elogind )
	x11-themes/adwaita-icon-theme
	>=gnome-extra/gnome-color-manager-3.1.2
	cups? (
		app-admin/system-config-printer
		net-print/cups-pk-helper )
	>=gnome-base/libgnomekbd-3
	wayland? ( dev-libs/libinput )
	!wayland? (
		>=x11-drivers/xf86-input-libinput-0.19.0
		input_devices_wacom? ( >=x11-drivers/xf86-input-wacom-0.33.0 ) )
"
PDEPEND=">=gnome-base/gnome-session-2.91.6-r1
	networkmanager? ( gnome-extra/nm-applet )" # networking panel can call into nm-connection-editor

BDEPEND="
	dev-libs/libxslt
	app-text/docbook-xsl-stylesheets
	app-text/docbook-xml-dtd:4.2
	x11-base/xorg-proto
	dev-libs/libxml2:2
	dev-util/gdbus-codegen
	dev-util/glib-utils
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	dev-util/meson
	$(vala_depend)
"

PATCHES=(
	"${FILESDIR}"/102/
)

src_unpack() {
	unpack ${P}.tar.gz
	pushd "${S}"/subprojects || die
		unpack libgnome-volume-control-${GVC_COMMIT}.tar.gz \
			libhandy-${LIBHANDY_COMMIT}.tar.gz
		mv -fT libgnome-volume-control-* gvc || die
		mv -fT libhandy-* libhandy || die
	popd || die
}

src_prepare() {
	vala_src_prepare
	default
}

src_configure() {
	local emesonargs=(
		$(meson_use bluetooth)
		$(meson_use v4l cheese)
		-Dcups=$(usex cups enabled disabled)
		-Ddocumentation=true # manpage
		-Dgoa=$(usex gnome-online-accounts enabled disabled)
		$(meson_use ibus)
		-Dkerberos=$(usex kerberos enabled disabled)
		$(meson_use networkmanager network_manager)
		-Dprivileged_group=wheel
		-Dsnap=false
		$(meson_use debug tracing)
		$(meson_use input_devices_wacom wacom)
		#$(meson_use wayland) # doesn't do anything in 3.34 and 3.36 due to unified gudev handling code
		# bashcompletions installed to $datadir/bash-completion/completions by v3.28.2, which is the same as $(get_bashcompdir)
		-Dmalcontent=false # unpackaged
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
