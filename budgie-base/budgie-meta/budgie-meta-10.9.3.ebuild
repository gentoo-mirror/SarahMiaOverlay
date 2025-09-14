# Copyright 2022~2025 Gentoo Authors and Sarah Mia Leibbrand
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Meta ebuild for Budgie Desktop with all official releases of needed packages"
HOMEPAGE="https://blog.buddiesofbudgie.org/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
IUSE="minimal all-packages"
REQUIRED_USE="?? ( minimal all-packages )"

RDEPEND="
	>=budgie-base/budgie-screensaver-5.1.0
	>=budgie-base/budgie-desktop-10.9.3
	>=budgie-base/budgie-desktop-view-1.3
	>=budgie-base/budgie-control-center-1.4.1
	!minimal? (
		>=budgie-extra/budgie-extras-1.9.0
		>=budgie-base/budgie-backgrounds-3.0
	)
	all-packages? (
		>=budgie-extra/budgie-analogue-clock-applet-2.2
		>=budgie-extra/budgie-brightness-control-applet-0.3
		>=budgie-extra/budgie-calendar-applet-5.3
		>=budgie-extra/budgie-clipboard-applet-1.1.0
		>=budgie-extra/budgie-haste-applet-0.3.0
		>=budgie-extra/budgie-pixel-saver-applet-4.0.0
		>=budgie-extra/budgie-screenshot-applet-0.4.3
		>=budgie-extra/budgie-systemmonitor-applet-0.2.1
		>=budgie-extra/budgie-extras-1.9.0[budgie_extras_applets_all]
	)
"
